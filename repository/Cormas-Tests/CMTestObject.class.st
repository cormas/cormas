Class {
	#name : #CMTestObject,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #'tests-accessing-entities' }
CMTestObject >> newTestModel [
	^ (CMTestModel
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;
		yourself
]
