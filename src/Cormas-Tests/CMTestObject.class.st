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

	| newModel |
	newModel := CMMockModel new.
	newModel simulationContext randomSeed: 42.
	^ newModel
]

{ #category : 'running' }
CMTestObject >> setUp [

	super setUp.
	model := self newTestModel.
	model initFixed.
]
