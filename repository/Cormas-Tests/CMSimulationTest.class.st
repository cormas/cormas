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
CMSimulationTest >> testProbes [

	| expectedProbes |
	
	expectedProbes := { 
		CMProbe
			name: 'Number of alive agents'
			method: (CMMockModel >> #numberOfAliveAgents)
			on: simulation cormasModel .
			
		CMProbe
			name: 'Number of dead agents'
			method: (CMMockModel >> #numberOfDeadAgents)
			on: simulation cormasModel .
	}.

	self assertCollection: simulation probes hasSameElements: expectedProbes.
]
