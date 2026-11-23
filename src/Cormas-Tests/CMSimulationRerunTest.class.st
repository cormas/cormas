"
I check that a saved run can be rerun from its folder: with the same settings it gives the same data, and differences of code or a model that changed are reported.
"
Class {
	#name : 'CMSimulationRerunTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'output'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'helpers' }
CMSimulationRerunTest >> dataFilesOf: aRun [

	^ (aRun children select: [ :each | each extension = 'csv' ])
		  collect: [ :each | each basename -> each contents ]
		  as: Dictionary
]

{ #category : 'helpers' }
CMSimulationRerunTest >> edit: aRun with: aBlock [
	"Change the settings of a saved run with aBlock, which takes them as a dictionary"

	| settings |
	settings := STONJSON fromString: (aRun / 'run.json') contents.
	aBlock value: settings.
	aRun / 'run.json' writeStreamDo: [ :stream |
		STONJSON put: settings onStream: stream ]
]

{ #category : 'helpers' }
CMSimulationRerunTest >> savedRun [
	"Initialize the simulation, run it until it stops and save it"

	simulation initializeSimulation.
	simulation runUntilStopped.
	^ simulation saveDataIn: output / 'first'
]

{ #category : 'running' }
CMSimulationRerunTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              shouldReleaseRandomSeedAfterInitialization: true;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              stopAfterStep: 3;
		              yourself.
	output := FileSystem memory / 'output'
]

{ #category : 'running' }
CMSimulationRerunTest >> tearDown [

	CMMockCow resetParameters.
	super tearDown
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARerunGivesTheSameData [

	| run rerun |
	CMMockCow initialEnergy: 1.
	run := self savedRun.
	CMMockCow initialEnergy: 2.
	rerun := (CMSimulation rerun: run) saveDataIn: output / 'second'.
	self
		assert: (self dataFilesOf: rerun)
		equals: (self dataFilesOf: run).
	self assert: (self dataFilesOf: run) size equals: 4
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARerunIsSeededAfterInitLikeItsRun [

	| run rerun |
	run := self savedRun.
	rerun := (CMSimulation rerun: run) saveDataIn: output / 'second'.
	self
		assert: ((STONJSON fromString: (rerun / 'run.json') contents) at:
				 'seedAfterInit')
		equals: ((STONJSON fromString: (run / 'run.json') contents) at:
				 'seedAfterInit')
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARerunRecordsItsOwnRun [

	| run rerun |
	simulation stopAfterStep: 10.
	simulation initializeSimulation.
	2 timesRepeat: [ simulation runStep ].
	run := simulation saveDataIn: output / 'first'.
	rerun := (CMSimulation rerun: run) saveDataIn: output / 'second'.
	self
		assert: ((STONJSON fromString: (rerun / 'run.json') contents) at:
				 'stopCondition')
		equals: '[ :model | model currentTimeStep >= 2 ]'
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARerunStopsAtTheLastStepOfTheRun [

	| run |
	simulation stopAfterStep: 10.
	simulation initializeSimulation.
	2 timesRepeat: [ simulation runStep ].
	run := simulation saveDataIn: output / 'first'.
	self assert: (CMSimulation rerun: run) currentTimeStep equals: 2
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARunMadeWithUncommittedChangesIsRerunWithAWarning [

	| run |
	run := self savedRun.
	self edit: run with: [ :settings |
			(settings at: 'versions') at: 'git' put: (Dictionary new
					 at: 'commit' put: 'abc';
					 at: 'uncommittedChanges' put: true;
					 yourself) ].
	self
		should: [ CMSimulation rerun: run ]
		raise: CMRerunWarning
		withExceptionDo: [ :warning |
				self assert: (warning messageText includesSubstring: 'abc').
				self assert:
					(warning messageText includesSubstring: 'uncommitted') ]
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARunRecordingItsLastStepOnlyIsRerunSo [

	| rerun |
	simulation recordLastStepOnly.
	rerun := CMSimulation rerun: self savedRun.
	self assert: rerun modelData steps asArray equals: #( 3 )
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARunWithAParameterTheModelNoLongerHasCannotBeRerun [

	| run |
	run := self savedRun.
	self edit: run with: [ :settings |
		((settings at: 'parameters') at: 'CMMockCow') at: 'oldEnergy' put: 3 ].
	self
		should: [ CMSimulation rerun: run ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'oldEnergy') ]
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARunWithAProbeTheModelNoLongerHasCannotBeRerun [

	| run |
	run := self savedRun.
	self edit: run with: [ :settings |
			(settings at: 'recording')
				at: 'notRecordedProbes'
				put: (Dictionary with: 'CMMockCow' -> #( 'oldProbe' )) ].
	self
		should: [ CMSimulation rerun: run ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'oldProbe') ]
]

{ #category : 'tests' }
CMSimulationRerunTest >> testARunWithAnotherVersionOfCormasIsRerunWithAWarning [

	| run |
	run := self savedRun.
	self
		edit: run
		with: [ :settings |
		(settings at: 'versions') at: 'cormas' put: '0.9.0' ].
	self
		should: [ CMSimulation rerun: run ]
		raise: CMRerunWarning
		withExceptionDo: [ :warning |
			self assert: (warning messageText includesSubstring: '0.9.0') ]
]

{ #category : 'tests' }
CMSimulationRerunTest >> testWhatWasNotRecordedIsNotRecordedInTheRerun [

	| run rerun |
	simulation
		recordEvery: 2;
		doNotRecord: CMMockGoat;
		doNotRecord: #numberOfDeadCells of: CMMockModel.
	simulation initializeSimulation.
	simulation doNotRecordEntity:
		(simulation cormasModel entitiesOfClass: CMMockCow) first.
	run := self savedRun.
	rerun := (CMSimulation rerun: run) saveDataIn: output / 'second'.
	self
		assert: (self dataFilesOf: rerun)
		equals: (self dataFilesOf: run).
	self deny:
		((self dataFilesOf: run) includesKey: 'data-CMMockGoat.csv')
]
