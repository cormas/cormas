Class {
	#name : 'CMSensitivityAnalysisProcessRunner',
	#superclass : 'Object',
	#instVars : [
		'sensitivityAnalysis',
		'currentSimulation',
		'analysisProcess',
		'shouldStop',
		'shouldPause',
		'pauseSemaphore'
	],
	#category : 'Cormas-UI-SensitivityAnalysis',
	#package : 'Cormas-UI',
	#tag : 'SensitivityAnalysis'
}

{ #category : 'initialization' }
CMSensitivityAnalysisProcessRunner >> initialize [

	super initialize.
	
	shouldStop := false.
	shouldPause := false.
	pauseSemaphore := Semaphore new
]

{ #category : 'testing' }
CMSensitivityAnalysisProcessRunner >> isPaused [

	^ shouldPause
]

{ #category : 'testing' }
CMSensitivityAnalysisProcessRunner >> isRunning [

	analysisProcess ifNil: [ ^ false ].
	^ analysisProcess isTerminated not
]

{ #category : 'actions' }
CMSensitivityAnalysisProcessRunner >> pause [

	shouldPause := true
]

{ #category : 'actions' }
CMSensitivityAnalysisProcessRunner >> resume [

	shouldPause := false.
	pauseSemaphore signal
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProcessRunner >> runAllCombinations [

	[
		| keepRunning |

		keepRunning := true.

		sensitivityAnalysis parameterCombinations do: [ :combination |
			keepRunning ifTrue: [
				shouldStop
					ifTrue: [ keepRunning := false ]
					ifFalse: [
						self waitWhilePaused.

						shouldStop
							ifTrue: [ keepRunning := false ]
							ifFalse: [
								self runOneCombination: combination ] ] ] ]
	] ensure: [
		currentSimulation := nil.
		sensitivityAnalysis announceFinished ]
]

{ #category : 'api - running' }
CMSensitivityAnalysisProcessRunner >> runInBackground [

	shouldStop := false.
	shouldPause := false.
	
	analysisProcess := [ self runAllCombinations ] newProcess.
	analysisProcess resume
]

{ #category : 'as yet unclassified' }
CMSensitivityAnalysisProcessRunner >> runOneCombination: aParameterCombination [

	| semaphore |
	semaphore := Semaphore new.
	
	currentSimulation := sensitivityAnalysis newSimulationFor: aParameterCombination.
	
	currentSimulation whenFinishedDo: [ 
		[ 
			sensitivityAnalysis
				recordDataFrom: currentSimulation
				combination: aParameterCombination.
				
			sensitivityAnalysis announceProgress
		] ensure: [
			semaphore signal ] ].
	
	currentSimulation runAllSteps.
	semaphore wait
]

{ #category : 'accessing' }
CMSensitivityAnalysisProcessRunner >> sensitivityAnalysis: anObject [

	sensitivityAnalysis := anObject
]

{ #category : 'actions' }
CMSensitivityAnalysisProcessRunner >> stop [

	shouldStop := true.
	shouldPause := false.
	pauseSemaphore signal
]

{ #category : 'actions' }
CMSensitivityAnalysisProcessRunner >> waitWhilePaused [

	[ shouldPause ] whileTrue: [ 
		pauseSemaphore wait ]
]
