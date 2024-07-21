"
A CormasEntityTest is a test class for testing the behavior of CormasEntity
"
Class {
	#name : 'CMEntityTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Model',
	#package : 'Cormas-Tests',
	#tag : 'Model'
}

{ #category : 'tests' }
CMEntityTest >> testAvailablePov [

	self assertCollection: CMMockAnimal availablePov hasSameElements: #(defaultPOV povId).
	self assertCollection: CMMockCow availablePov hasSameElements: #(pov defaultPOV povId).
	self assertCollection: CMMockGoat availablePov hasSameElements: #(pov defaultPOV povId).
	self assertCollection: CMMockCell availablePov hasSameElements: #(pov defaultPOV povId).
]

{ #category : 'tests' }
CMEntityTest >> testColorOfNumber [
	self assert: (CMEntity colorOfNumber: 65) equals: Color purple
]

{ #category : 'tests' }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

{ #category : 'tests' }
CMEntityTest >> testCormasModel [
	| model |
	model := (CMMockModel newWithActiveInit: #initRandom)
		initializeSimulation;
		createGridNumberOfRows: 3
			numberOfColumns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self assert: model centralCell cormasModel identicalTo: model.
	model
		createN: 5
		randomlyLocatedAloneEntities: CMMockCow.
	model theAgents do: [ :agent | self assert: agent cormasModel identicalTo: model ]
]

{ #category : 'tests' }
CMEntityTest >> testEntityName [
	self assert: CMMockCell entityName equals: 'Cell'.
	self assert: CMMockCow entityName equals: 'Cow'.
	self assert: CMMockGoat entityName equals: 'Goat'.
]

{ #category : 'tests' }
CMEntityTest >> testModelClass [
	self
		assert: CMMockCell modelClass
		identicalTo: CMMockModel
]
