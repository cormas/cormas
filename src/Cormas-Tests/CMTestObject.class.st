Class {
	#name : 'CMTestObject',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests-accessing-entities' }
CMTestObject >> newTestModel [

	| context |
	context := CMSimulationContext new.
	context randomSeed: 42.
 	
	^ CMMockModel new
		simulationContext: context;
		yourself.
]

{ #category : 'running' }
CMTestObject >> setUp [

	super setUp.
	model := self newTestModel.
	model initFixed.
]
