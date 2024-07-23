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

	| model |
	super setUp.
	
	model := CMMockModel new.
	
	simulation := (CMSimulation for: model)
		activeInitMethod: (CMMockModel >> #initFixed);
		activeControlMethod: (CMMockModel >> #step:);
		initializeSimulation;
		yourself.
]

{ #category : 'tests' }
CMSimulationTest >> testData [

	| expectedData |
	expectedData := #( #( 11 5 ) #( 5 11 ) #( 11 5 ) #( 5 11 ) #( 11 5 )
	                   #( 5 11 ) ) asOrderedCollection collect: [ :row |
		                Dictionary newFrom: {
				                (simulation probes first name -> row first).
				                (simulation probes second name -> row second) } ].

	5 timesRepeat: [ simulation runStep ].
	self assert: simulation data equals: expectedData 
]

{ #category : 'tests' }
CMSimulationTest >> testProbes [

	| expectedProbes |
	
	expectedProbes := { 
		CMProbe
			name: 'Number of alive cells'
			method: (CMMockModel >> #numberOfAliveCells)
			on: simulation cormasModel .
			
		CMProbe
			name: 'Number of dead cells'
			method: (CMMockModel >> #numberOfDeadCells)
			on: simulation cormasModel .
	}.

	self assertCollection: simulation probes hasSameElements: expectedProbes.
]
