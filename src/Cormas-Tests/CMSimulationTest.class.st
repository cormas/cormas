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
	
	simulation := (CMSimulation for: CMMockModel)
		randomSeed: 42;
		activeInitSelector: #initFixed;
		activeControlSelector: #step:;
		initializeSimulation;
		yourself.
]

{ #category : 'tests' }
CMSimulationTest >> testCurrenTimeStepStartsWithZero [

	self assert: simulation currentTimeStep equals: 0
]

{ #category : 'tests' }
CMSimulationTest >> testData [

	| expectedData |
	expectedData := #( #( 11 5 ) #( 5 11 ) #( 11 5 ) #( 5 11 )
	                   #( 11 5 ) #(5 11) ) asOrderedCollection collect: [ :row |
		                Dictionary newFrom: {
				                ('Number of alive cells' -> row first).
				                ('Number of dead cells' -> row second) } ].

	5 timesRepeat: [ simulation runStep ].
	self assert: simulation data equals: expectedData 
]

{ #category : 'tests' }
CMSimulationTest >> testDefaultFinalTimeStep [

	self assert: simulation class defaultFinalTimeStep equals: 100
]

{ #category : 'tests' }
CMSimulationTest >> testProbes [

	| expectedProbes |
	
	expectedProbes := { 
		CMProbe
			name: 'Number of alive cells'
			colorString: '0000FF'
			selector: #numberOfAliveCells
			on: simulation cormasModel .
			
		CMProbe
			name: 'Number of dead cells'
			colorString: 'FF0000'
			selector: #numberOfDeadCells
			on: simulation cormasModel .
	}.

	self assertCollection: simulation probes hasSameElements: expectedProbes.
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
CMSimulationTest >> testRunAllStepsAfterEachDo [

	| done counter |
	done := Semaphore new.
	counter := 0.
	
	simulation whenFinishedDo: [ done signal ].
	simulation runAllStepsAfterEachDo: [ counter := counter + 1 ].
	
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
	
	simulation whenFinishedDo: [ done signal ].
	
	stepsWhenBlockIsExecuted := OrderedCollection new.
	simulation runAllStepsAfterEach: 3 do: [ stepsWhenBlockIsExecuted add: simulation currentTimeStep ].
	
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
	
	simulation whenFinishedDo: [ done signal ].
	
	stepsWhenBlockIsExecuted := OrderedCollection new.
	simulation runAllStepsAfterEach: 2 do: [ stepsWhenBlockIsExecuted add: simulation currentTimeStep ].
	
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
			or: [ model currentTimeStep >= 10000 ] ].
		
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
