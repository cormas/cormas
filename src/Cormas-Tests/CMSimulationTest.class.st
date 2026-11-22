Class {
	#name : 'CMSimulationTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulation'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMSimulationTest >> setUp [

	super setUp.
	
	simulation := (CMSimulation for: CMMockModel new)
		randomSeed: 42;
		activeInitSelector: #initFixed;
		activeControlSelector: #step;
		initializeSimulation;
		yourself.
]

{ #category : 'tests' }
CMSimulationTest >> testANewInitStartsANewModelData [

	3 timesRepeat: [ simulation runStep ].
	simulation initializeSimulation.
	self assert: simulation modelData steps asArray equals: #( 0 )
]

{ #category : 'tests' }
CMSimulationTest >> testAPausedSimulationWaitsUntilItIsResumed [

	| finished step |
	finished := Semaphore new.
	simulation
		stopWhen: [ :model | model currentTimeStep >= 1000 ];
		whenFinishedDo: [ finished signal ];
		runAllStepsAfterEachIntervalDo: [
			simulation currentTimeStep = 3 ifTrue: [ simulation pause ] ].
	[
		self waitUntilPaused.
		step := simulation currentTimeStep.
		(Delay forMilliseconds: 100) wait.
		self assert: simulation currentTimeStep equals: step.
		simulation resume.
		self deny: (finished waitTimeoutSeconds: 5).
		self assert: simulation currentTimeStep equals: 1000 ] ensure: [
			simulation stopWhen: [ :model | true ].
			simulation resume ]
]

{ #category : 'tests' }
CMSimulationTest >> testASimulationIsRunningBetweenItsStepsUntilItFinishes [

	| finished |
	finished := Semaphore new.
	simulation
		stopWhen: [ :model | false ];
		whenFinishedDo: [ finished signal ];
		runAllStepsAfterEachIntervalDo: [ (Delay forMilliseconds: 20) wait ].
	[
		(Delay forMilliseconds: 50) wait.
		self assert: simulation isSimulationRunning ] ensure: [
			simulation stopWhen: [ :model | true ].
			finished waitTimeoutSeconds: 5 ].
	(Delay forMilliseconds: 50) wait.
	self deny: simulation isSimulationRunning
]

{ #category : 'tests' }
CMSimulationTest >> testAStoppedSimulationCannotBeResumed [

	| step |
	simulation
		stopWhen: [ :model | false ];
		runAllStepsAfterEachIntervalDo: [
			simulation currentTimeStep = 3 ifTrue: [ simulation pause ] ].
	[
		self waitUntilPaused.
		simulation stop.
		step := simulation currentTimeStep.
		simulation resume.
		(Delay forMilliseconds: 50) wait.
		self assert: simulation currentTimeStep equals: step ] ensure: [
			simulation stopWhen: [ :model | true ].
			simulation resume ]
]

{ #category : 'tests' }
CMSimulationTest >> testCurrenTimeStepStartsWithZero [

	self assert: simulation currentTimeStep equals: 0
]

{ #category : 'tests' }
CMSimulationTest >> testDefaultFinalTimeStep [

	self assert: simulation class defaultFinalTimeStep equals: 100
]

{ #category : 'tests' }
CMSimulationTest >> testInitializeSimulationResetsCurrentTimeStep [

	simulation
		runStep;
		runStep.
	self assert: simulation currentTimeStep equals: 2.

	simulation initializeSimulation.

	self assert: simulation currentTimeStep equals: 0
]

{ #category : 'tests' }
CMSimulationTest >> testPausingLetsTheCurrentStepFinish [
	"The block after each step belongs to the step: pausing from it must not stop it in the middle"

	| finished finishedItsStep |
	finished := Semaphore new.
	finishedItsStep := false.
	simulation
		stopWhen: [ :model | false ];
		whenFinishedDo: [ finished signal ];
		runAllStepsAfterEachIntervalDo: [
				simulation currentTimeStep = 3 ifTrue: [
							simulation pause.
							finishedItsStep := true ] ].
	[
		self waitUntilPaused.
		self assert: finishedItsStep.
		self assert: simulation currentTimeStep equals: 3 ] ensure: [
			simulation stopWhen: [ :model | true ].
			simulation resume.
			finished waitTimeoutSeconds: 5 ]
]

{ #category : 'tests' }
CMSimulationTest >> testProbes [

	self
		assert: simulation probes asArray
		equals: #( #numberOfAliveCells #numberOfDeadCells )
]

{ #category : 'tests' }
CMSimulationTest >> testRunAllSteps [

	| done |
	done := Semaphore new.

	self assert: simulation currentTimeStep equals: 0.
	
	simulation whenFinishedDo: [ done signal ].
	simulation runAllSteps.
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	self assert: simulation currentTimeStep equals: simulation class defaultFinalTimeStep
]

{ #category : 'tests' }
CMSimulationTest >> testRunAllStepsAfterEachIntervalDo [

	| done counter |
	done := Semaphore new.
	counter := 0.
	
	simulation whenFinishedDo: [ done signal ].
	simulation runAllStepsAfterEachIntervalDo: [ counter := counter + 1 ].
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	
	"Did we run the simulation until the end?"
	self assert: simulation currentTimeStep equals: simulation class defaultFinalTimeStep.
	
	"Did we execute the given block (increase the counter) after each step?"
	self assert: counter equals: simulation class defaultFinalTimeStep
]

{ #category : 'tests' }
CMSimulationTest >> testRunAllStepsAfterEachThreeStepsDo [

	| finalStep stepsWhenBlockIsExecuted done |
	done := Semaphore new.
	
	"Run 10 steps of a simulation - we need this number to be even"
	finalStep := 10.
	simulation stopAfterStep: finalStep.
	simulation stepsPerInterval: 3.
	
	simulation whenFinishedDo: [ done signal ].
	
	stepsWhenBlockIsExecuted := OrderedCollection new.
	simulation runAllStepsAfterEachIntervalDo: [ stepsWhenBlockIsExecuted add: simulation currentTimeStep ].
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	
	"Did we run the simulation until the end?"
	self assert: simulation currentTimeStep equals: finalStep.
	
	"Exact steps when the block must be executed"
	"Important: on step 10, the block is not executed but simulation still runs on that step"
	self assertCollection: stepsWhenBlockIsExecuted hasSameElements: #(3 6 9)
]

{ #category : 'tests' }
CMSimulationTest >> testRunAllStepsAfterEachTwoStepsDo [

	| finalStep stepsWhenBlockIsExecuted done |
	done := Semaphore new.
	
	"Run 10 steps of a simulation - we need this number to be even"
	finalStep := 10.
	simulation stopAfterStep: finalStep.
	simulation stepsPerInterval: 2.
	
	simulation whenFinishedDo: [ done signal ].
	
	stepsWhenBlockIsExecuted := OrderedCollection new.
	simulation runAllStepsAfterEachIntervalDo: [ stepsWhenBlockIsExecuted add: simulation currentTimeStep ].
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	
	"Did we run the simulation until the end?"
	self assert: simulation currentTimeStep equals: finalStep.
	
	"Exact steps when the block must be executed"
	self assertCollection: stepsWhenBlockIsExecuted hasSameElements: #(2 4 6 8 10)
]

{ #category : 'tests' }
CMSimulationTest >> testRunStep [

	| cellStateMatrix expectedCellStateMatrix agent1 agent2 |
	simulation runStep.
	
	cellStateMatrix := simulation cormasModel cells
		collect: [ :each | each state = #alive ifTrue: [ 1 ] ifFalse: [ 0 ] ].
		
	expectedCellStateMatrix := simulation cormasModel invertedCellMatrix flattened asOrderedCollection.
	
	agent1 := (simulation cormasModel @@ CMMockCow) first.
	agent2 := (simulation cormasModel @@ CMMockGoat) first.
	
	self assert: simulation currentTimeStep equals: 1.
	self assert: cellStateMatrix equals: expectedCellStateMatrix.
	self assert: agent1 coordinates equals: 2@2.
	self assert: agent2 coordinates equals: 4@2.
]

{ #category : 'tests' }
CMSimulationTest >> testRunningAStepAnnouncesItsEndOnceTheModelHasStepped [

	| endedSteps cowPositionAtEnd recordedStepsAtEnd |
	endedSteps := OrderedCollection new.
	simulation simulationContext timeStepAnnouncer
		when: CMTimeStepEnded
		do: [ :announcement |
				endedSteps add: announcement timeStep.
				cowPositionAtEnd := (simulation cormasModel @@ CMMockCow) first
					                    coordinates.
				recordedStepsAtEnd := simulation modelData size ]
		for: self.
	simulation runStep.
	self assert: endedSteps asArray equals: #( 1 ).
	self assert: cowPositionAtEnd equals: 2 @ 2.
	self assert: recordedStepsAtEnd equals: simulation modelData size
]

{ #category : 'tests' }
CMSimulationTest >> testStopAfterStep [

	| done |
	done := Semaphore new.

	simulation stopAfterStep: 7.
	self assert: simulation currentTimeStep equals: 0.
	
	simulation whenFinishedDo: [ done signal ].

	simulation runAllSteps.
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	self assert: simulation currentTimeStep equals: 7.
]

{ #category : 'tests' }
CMSimulationTest >> testStopWhen [

	| done |
	done := Semaphore new.

	"Stop when cell 1@1 has a goat on it or when the simulation runs for 10000 steps (to ensure that it doesn't run endlessly if something goes wrong)"
	simulation stopWhen: [ :model |
		(model cells first hasOccupantsOfClass: CMMockGoat)
			or: [ model simulationContext currentTimeStep >= 10000 ] ].
		
	simulation whenFinishedDo: [ done signal ].
		
	simulation runAllSteps.
	
	"Wait deterministically for completion (and fail if it never completes)"
	self deny: (done waitTimeoutSeconds: 10).
	
	"Normally, at least one step of the simulation should be executed. Otherwise this is not a very good test"
	self assert: simulation currentTimeStep > 0.
	
	"Normally, we should stop before 10000 steps"
	self assert: simulation currentTimeStep < 10000.

	"Was the condition satisfied?"
	self assert: (simulation cormasModel cells first hasOccupantsOfClass: CMMockGoat).
]

{ #category : 'tests' }
CMSimulationTest >> testStoppingEndsARunningSimulation [

	| step |
	simulation
		stopWhen: [ :model | false ];
		runAllStepsAfterEachIntervalDo: [ (Delay forMilliseconds: 5) wait ].
	[
		(Delay forMilliseconds: 50) wait.
		simulation stop.
		step := simulation currentTimeStep.
		(Delay forMilliseconds: 50) wait.
		self assert: simulation currentTimeStep equals: step.
		self deny: simulation isSimulationRunning ] ensure: [
		simulation stopWhen: [ :model | true ] ]
]

{ #category : 'tests' }
CMSimulationTest >> testTheModelDataHasARowForEachStep [

	5 timesRepeat: [ simulation runStep ].
	self
		assert: simulation modelData steps asArray
		equals: #( 0 1 2 3 4 5 ).
	self
		assert: (simulation modelData column: #numberOfAliveCells) asArray
		equals: #( 11 5 11 5 11 5 ).
	self
		assert: (simulation modelData column: #numberOfDeadCells) asArray
		equals: #( 5 11 5 11 5 11 )
]

{ #category : 'running' }
CMSimulationTest >> waitUntilPaused [
	"Wait until the simulation has stopped between two steps, but not forever"

	| tries |
	tries := 0.
	[ simulation isSimulationRunning and: [ tries < 100 ] ] whileTrue: [
			(Delay forMilliseconds: 10) wait.
			tries := tries + 1 ].
	self deny: simulation isSimulationRunning
]
