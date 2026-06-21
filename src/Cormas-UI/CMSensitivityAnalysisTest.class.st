Class {
	#name : 'CMSensitivityAnalysisTest',
	#superclass : 'TestCase',
	#instVars : [
		'setup',
		'analysis',
		'parameter1',
		'parameter2',
		'probe1',
		'probe2'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'running' }
CMSensitivityAnalysisTest >> setUp [
	
	| modelClass |
	super setUp.
	
	modelClass := CMMockModel.
	
	parameter1 := modelClass parameters detect: [ :each |
		each getterSelector = #initialNumberOfCows ].
	
	parameter2 := modelClass parameters detect: [ :each |
		each getterSelector = #initialNumberOfGoats ].
	
	probe1 := modelClass availableProbes first.
	probe2 := modelClass availableProbes second.

	setup := CMSensitivityAnalysisSetup new
		modelClass: CMMockModel;
		initSelector: #initFixed;
		controlSelector: #step;
		finalTimeStep: 1000;
		probes: { probe1 . probe2 };
		parameterSamplings: {
			parameter1 -> #(1 2 3).
			parameter2 -> #(5 4)
		} asDictionary;
		yourself.
		
	analysis := CMSensitivityAnalysis new
		setup: setup;
		yourself
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testDataIsUpdatedBeforeAnalysisFinishes [

	| firstProgressSemaphore finishedSemaphore dataSizeAtFirstProgress |

	firstProgressSemaphore := Semaphore new.
	finishedSemaphore := Semaphore new.
	dataSizeAtFirstProgress := nil.

	analysis whenProgressDo: [ :runningAnalysis |
		dataSizeAtFirstProgress ifNil: [
			dataSizeAtFirstProgress := runningAnalysis data size.
			firstProgressSemaphore signal ] ].

	analysis whenFinishedDo: [ :finishedAnalysis |
		finishedSemaphore signal ].

	analysis run.

	self deny: (firstProgressSemaphore waitTimeoutMilliseconds: 1000).

	self assert: dataSizeAtFirstProgress equals: 1.
	self assert: analysis isRunning.

	self deny: (finishedSemaphore waitTimeoutMilliseconds: 3000)
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testFinishedCallbackIsCalledOnce [

	| semaphore finishedCount |

	semaphore := Semaphore new.
	finishedCount := 0.

	analysis whenFinishedDo: [ :finishedAnalysis |
		finishedCount := finishedCount + 1.
		semaphore signal ].

	analysis run.

	self deny: (semaphore waitTimeoutMilliseconds: 3000).
	(Delay forMilliseconds: 100) wait.

	self assert: finishedCount equals: 1
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testIncompleteSetupHasZeroSimulations [

	setup := CMSensitivityAnalysisSetup new.
	self assert: setup numberOfSimulations equals: 0
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testNewAnalysisHasNoDataAndZeroProgress [
	
	analysis := CMSensitivityAnalysis new.
	self assert: analysis data isEmpty.
	self assert: analysis numberOfCompletedSimulations equals: 0.
	self assert: analysis progress equals: 0
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testNewSimulationForCombination [

	| simulation |

	simulation := analysis newSimulationFor: {
		parameter1 -> 2.
		parameter2 -> 4
	} asDictionary.

	self assert: simulation cormasModel initialNumberOfCows equals: 2.
	self assert: simulation cormasModel initialNumberOfGoats equals: 4
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testNumberOfSimulations [ 

	self assert: setup numberOfSimulations equals: 6
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testParameterCombinations [

	| combinations |

	combinations := analysis parameterCombinations.

	self assert: combinations size equals: 6.

	self assert: (combinations anySatisfy: [ :each |
		(each at: parameter1) = 1 and: [
		(each at: parameter2) = 5 ] ]).

	self assert: (combinations anySatisfy: [ :each |
		(each at: parameter1) = 2 and: [
		(each at: parameter2) = 4 ] ])
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testPausePreventsFurtherProgressUntilResume [

	| firstProgressSemaphore finishedSemaphore dataSizeAfterPause dataSizeLater |

	firstProgressSemaphore := Semaphore new.
	finishedSemaphore := Semaphore new.

	analysis whenProgressDo: [ :runningAnalysis |
		runningAnalysis data size = 1 ifTrue: [
			firstProgressSemaphore signal ] ].

	analysis whenFinishedDo: [ :finishedAnalysis |
		finishedSemaphore signal ].

	[
		analysis run.

		self deny: (firstProgressSemaphore waitTimeoutMilliseconds: 1000).

		analysis pause.
		(Delay forMilliseconds: 300) wait.

		dataSizeAfterPause := analysis data size.

		(Delay forMilliseconds: 300) wait.
		dataSizeLater := analysis data size.

		self assert: analysis isPaused.
		self assert: analysis isRunning.
		self assert: dataSizeLater equals: dataSizeAfterPause.

		analysis resume.

		self deny: (finishedSemaphore waitTimeoutMilliseconds: 3000).

		self assert: analysis isPaused not.
		self assert: analysis data size equals: setup numberOfSimulations
	] ensure: [
		analysis resume ]
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testProgress [

	| simulation combination |

	simulation := CMSimulation new.

	simulation data add: {
		probe1 name -> 10.
		probe2 name -> 4
	} asDictionary.

	combination := {
		parameter1 -> 2.
		parameter2 -> 10
	} asDictionary.

	analysis
		recordDataFrom: simulation
		combination: combination.

	self assert: analysis progress equals: (1 / 6)
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testProgressCallbackIsCalledForEachSimulation [

	| semaphore progressCount |

	semaphore := Semaphore new.
	progressCount := 0.

	analysis whenProgressDo: [ :runningAnalysis |
		progressCount := progressCount + 1 ].

	analysis whenFinishedDo: [ :finishedAnalysis |
		semaphore signal ].

	analysis run.

	self deny: (semaphore waitTimeoutMilliseconds: 3000).

	self assert: progressCount equals: setup numberOfSimulations
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRecordDataFromCombination [

	| simulation combination row |

	simulation := CMSimulation new.
	
	simulation data add: {
		probe1 name -> 10.
		probe2 name -> 4
	} asDictionary.
	
	combination := {
		parameter1 -> 2 .
		parameter2 -> 5
	} asDictionary.
	
	row := analysis
		recordDataFrom: simulation
		combination: combination.
		
	self assert: analysis data size equals: 1.
	self assert: analysis numberOfCompletedSimulations equals: 1.
	
	self assert: (row at: parameter1 name) equals: 2.
	self assert: (row at: parameter2 name) equals: 5.
	self assert: (row at: probe1 name) equals: 10.
	self assert: (row at: probe2 name) equals: 4.
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testResumeAfterPauseCompletesAnalysis [

	| firstProgressSemaphore finishedSemaphore |

	firstProgressSemaphore := Semaphore new.
	finishedSemaphore := Semaphore new.

	analysis whenProgressDo: [ :runningAnalysis |
		runningAnalysis data size = 1 ifTrue: [
			firstProgressSemaphore signal ] ].

	analysis whenFinishedDo: [ :finishedAnalysis |
		finishedSemaphore signal ].

	[
		analysis run.

		self deny: (firstProgressSemaphore waitTimeoutMilliseconds: 1000).

		analysis pause.
		(Delay forMilliseconds: 100) wait.
		analysis resume.

		self deny: (finishedSemaphore waitTimeoutMilliseconds: 3000).

		self assert: analysis data size equals: setup numberOfSimulations.
		self assert: analysis progress equals: 1
	] ensure: [
		analysis resume ]
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunCompletesAllSimulations [

	| semaphore finished |

	semaphore := Semaphore new.
	finished := false.

	analysis whenFinishedDo: [ :finishedAnalysis |
		finished := true.
		semaphore signal ].

	analysis run.

	self deny: (semaphore waitTimeoutMilliseconds: 3000).

	self assert: finished.
	self assert: analysis data size equals: setup numberOfSimulations.
	self assert: analysis numberOfCompletedSimulations equals: setup numberOfSimulations.
	self assert: analysis progress equals: 1
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testRunIsAsynchronous [

	| semaphore finished |
	semaphore := Semaphore new.
	finished := false.

	analysis whenFinishedDo: [ :finishedAnalysis |
		finished := true.
		semaphore signal ].

	analysis run.

	self assert: analysis isRunning.
	self assert: analysis data isEmpty.

	self deny: (semaphore waitTimeoutMilliseconds: 1000).

	self assert: finished.
	self assert: analysis isRunning not
]

{ #category : 'tests' }
CMSensitivityAnalysisTest >> testStopPreventsRemainingSimulations [

	| firstProgressSemaphore finishedSemaphore dataSizeAfterStop |

	firstProgressSemaphore := Semaphore new.
	finishedSemaphore := Semaphore new.

	analysis whenProgressDo: [ :runningAnalysis |
		runningAnalysis data size = 1 ifTrue: [
			firstProgressSemaphore signal ] ].

	analysis whenFinishedDo: [ :finishedAnalysis |
		finishedSemaphore signal ].

	analysis run.

	self deny: (firstProgressSemaphore waitTimeoutMilliseconds: 1000).

	analysis stop.
	dataSizeAfterStop := analysis data size.

	self deny: (finishedSemaphore waitTimeoutMilliseconds: 3000).

	self assert: analysis isRunning not.
	self assert: analysis data size <= (dataSizeAfterStop + 1).
	self assert: analysis data size < setup numberOfSimulations
]
