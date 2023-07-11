Class {
	#name : #CMTestObject,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #accessing }
CMTestObject >> model [

	^ model
]

{ #category : #accessing }
CMTestObject >> model: anObject [

	model := anObject
]

{ #category : #'tests-accessing-entities' }
CMTestObject >> newTestModel [
 	
	^ (CMMockModel	newWithActiveInit: #init)
		initializeSimulation;
		"createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;"
		yourself
]

{ #category : #running }
CMTestObject >> setUp [

	super setUp.
	self model: self newTestModel.
]
