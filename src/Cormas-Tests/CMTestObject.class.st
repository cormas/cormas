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
 	
	^ CMMockModel new
		randomSeed: 42;
		yourself.
]

{ #category : 'running' }
CMTestObject >> setUp [

	super setUp.
	model := self newTestModel.
	model initFixed.
]
