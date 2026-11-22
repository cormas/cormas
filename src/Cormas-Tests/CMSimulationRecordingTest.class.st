Class {
	#name : 'CMSimulationRecordingTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation',
		'model'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMSimulationRecordingTest >> cow [

	^ (model entitiesOfClass: CMMockCow) first
]

{ #category : 'running' }
CMSimulationRecordingTest >> setUp [

	super setUp.
	simulation := (CMSimulation for: CMMockModel new)
		              randomSeed: 41;
		              activeInitSelector: #initFixed;
		              activeControlSelector: #step;
		              yourself.
	model := simulation cormasModel
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAClassCanBeRecordedAgain [

	simulation doNotRecord: CMMockCow.
	simulation record: CMMockCow.
	simulation initializeSimulation.
	self assert: (simulation dataOf: self cow) size equals: 1
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAClassIsWrittenAsCsvWithARowForEachInstanceAndStep [
	| cow lines |
	simulation initializeSimulation.
	simulation runStep.
	cow := (model entitiesOfClass: CMMockCow) first.
	lines := (String streamContents: [ :stream |
		          simulation writeCsvOfClass: CMMockCow on: stream ]) lines.
	self assert: lines size equals: 3.
	self assert: lines first equals: 'step,id,label,energy'.
	self
		assert: lines second
		equals: '0,1,"' , ((simulation dataOf: cow) label) , '",' , ((simulation dataOf: cow) column: #energy) first printString
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAClassThatIsNotRecordedCannotBeWrittenAsCsv [
	simulation doNotRecord: CMMockCow.
	simulation initializeSimulation.
	self
		should: [ String streamContents: [ :stream | simulation writeCsvOfClass: CMMockCow on: stream ] ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAClassThatIsNotRecordedHasNoData [

	simulation doNotRecord: CMMockCow.
	simulation initializeSimulation.
	simulation runStep.
	self should: [ simulation dataOf: self cow ] raise: CMRecordingError.
	self
		assert:
		(simulation dataOf: (model entitiesOfClass: CMMockGoat) first) size
		equals: 2
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAClassWhoseProbesAreAllSwitchedOffIsNotRecorded [

	simulation doNotRecord: #energy of: CMMockAnimal.
	simulation initializeSimulation.
	self should: [ simulation dataOf: self cow ] raise: CMRecordingError
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testANewInitStartsNewData [

	simulation initializeSimulation.
	2 timesRepeat: [ simulation runStep ].
	simulation initializeSimulation.
	self
		assert: (simulation dataOf: self cow) steps asArray
		equals: #( 0 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAProbeCanBeRecordedAgain [

	simulation doNotRecord: #numberOfDeadCells of: CMMockModel.
	simulation record: #numberOfDeadCells of: CMMockModel.
	simulation initializeSimulation.
	self assert: simulation modelData columnNames size equals: 2
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAProbeThatCannotBeRecordedNamesItsEntity [

	| cow |
	simulation initializeSimulation.
	cow := self cow.
	cow energy: nil.
	self
		should: [ simulation runStep ]
		raise: CMRecordingError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: cow printString).
				self assert: (error messageText includesSubstring: 'energy') ]
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAProbeThatIsNotRecordedHasNoColumn [

	simulation doNotRecord: #numberOfDeadCells of: CMMockModel.
	simulation initializeSimulation.
	self
		assert: simulation modelData columnNames asArray
		equals: #( #numberOfAliveCells )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityCreatedDuringTheRunHasRowsFromItsCreation [

	| newCow |
	simulation initializeSimulation.
	simulation runStep.
	newCow := model newEntity: CMMockCow.
	newCow moveTo: (model cellAt: 1 at: 1).
	simulation runStep.
	self assert: (simulation dataOf: newCow) steps asArray equals: #( 2 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityIsLabelledByItsPrintString [

	simulation initializeSimulation.
	self
		assert: (simulation dataOf: self cow) label
		equals: self cow printString
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityOfAClassWithoutProbesHasNoData [

	simulation initializeSimulation.
	self
		should: [
		simulation dataOf: (model entitiesOfClass: CMMockAggregate) first ]
		raise: CMRecordingError
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityThatDiedKeepsItsRows [

	| cow |
	simulation initializeSimulation.
	cow := self cow.
	simulation runStep.
	cow die.
	simulation runStep.
	self assert: (simulation dataOf: cow) steps asArray equals: #( 0 1 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityThatIsNotRecordedGetsNoMoreRows [

	simulation initializeSimulation.
	simulation doNotRecordEntity: self cow.
	2 timesRepeat: [ simulation runStep ].
	self
		assert: (simulation dataOf: self cow) steps asArray
		equals: #( 0 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testAnEntityThatIsNotRecordedStaysSoAfterANewInit [

	simulation initializeSimulation.
	simulation doNotRecordEntity: self cow.
	simulation initializeSimulation.
	self should: [ simulation dataOf: self cow ] raise: CMRecordingError
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testDataIsRecordedEveryNSteps [

	simulation recordEvery: 2.
	simulation initializeSimulation.
	5 timesRepeat: [ simulation runStep ].
	self assert: simulation modelData steps asArray equals: #( 0 2 4 ).
	self
		assert: (simulation dataOf: self cow) steps asArray
		equals: #( 0 2 4 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testEveryInstanceOfAClassWithProbesIsRecordedAtEachStep [

	simulation initializeSimulation.
	2 timesRepeat: [ simulation runStep ].
	self
		assert: (simulation dataOf: self cow) steps asArray
		equals: #( 0 1 2 ).
	self
		assert: (simulation dataOf: self cow) columnNames asArray
		equals: #( #energy ).
	self
		assert: (simulation dataOf: model cells first) columnNames asArray
		equals: #( #state )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testNotRecordingAClassAlsoAppliesToItsSubclasses [

	simulation doNotRecord: CMMockAnimal.
	simulation initializeSimulation.
	self should: [ simulation dataOf: self cow ] raise: CMRecordingError
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testSwitchingOffAProbeThatDoesNotExistRaisesAnError [

	self
		should: [ simulation doNotRecord: #weight of: CMMockAnimal ]
		raise: Error
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'weight') ]
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testTheChartsOfAnEntityAreItsChartMethodsAndThoseItInherits [
	self assert: CMMockCow chartSelectors asArray equals: #( #chartEnergy ).
	self assert: CMMockCell chartSelectors isEmpty
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testTheDataOfAllInstancesOfAClassIncludesItsSubclasses [
	| cow goat |
	simulation initializeSimulation.
	cow := (model entitiesOfClass: CMMockCow) first.
	goat := (model entitiesOfClass: CMMockGoat) first.
	self
		assert: ((simulation dataOfAll: CMMockAnimal) collect: [ :each | each label ]) asArray
		equals: { cow printString. goat printString }
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testTheDataOfAllInstancesOfAClassThatIsNotRecordedRaisesAnError [
	simulation doNotRecord: CMMockAnimal.
	simulation initializeSimulation.
	self
		should: [ simulation dataOfAll: CMMockCow ]
		raise: CMRecordingError
		withExceptionDo: [ :error |
			self assert: (error messageText includesSubstring: 'CMMockCow') ]
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testTheLastStepIsAlwaysRecorded [

	simulation
		recordEvery: 2;
		stopAfterStep: 5.
	simulation initializeSimulation.
	5 timesRepeat: [ simulation runStep ].
	self assert: simulation modelData steps asArray equals: #( 0 2 4 5 )
]

{ #category : 'tests' }
CMSimulationRecordingTest >> testTheValuesOfAnEntityAreItsProbes [

	| cell |
	simulation initializeSimulation.
	cell := model cells first.
	simulation runStep.
	self
		assert: ((simulation dataOf: cell) column: #state) last
		equals: cell state.
	self
		assert: ((simulation dataOf: self cow) column: #energy) last
		equals: self cow energy
]
