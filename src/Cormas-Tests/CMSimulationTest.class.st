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
CMSimulationTest >> testProbes [

	| expectedProbes |
	
	expectedProbes := { 
		CMProbe
			name: 'Number of alive cells'
			colorString: '0000FF'
			method: (CMMockModel >> #numberOfAliveCells)
			on: simulation cormasModel .
			
		CMProbe
			name: 'Number of dead cells'
			colorString: 'FF0000'
			method: (CMMockModel >> #numberOfDeadCells)
			on: simulation cormasModel .
	}.

	self assertCollection: simulation probes hasSameElements: expectedProbes.
]

{ #category : 'tests' }
CMSimulationTest >> testRunStep [

	| cellStateMatrix expectedCellStateMatrix agent1 agent2 |
	simulation runStep.
	
	cellStateMatrix := simulation cormasModel cells
		collect: [ :each | each state = #alive ifTrue: [ 1 ] ifFalse: [ 0 ] ].
		
	expectedCellStateMatrix := simulation cormasModel invertedCellMatrix flattened asOrderedCollection.
	
	agent1 := simulation cormasModel theCows first.
	agent2 := simulation cormasModel theGoats first.
	
	self assert: simulation currentTimeStep equals: 1.
	self assert: cellStateMatrix equals: expectedCellStateMatrix.
	self assert: agent1 coordinates equals: 2@2.
	self assert: agent2 coordinates equals: 4@2.
]
