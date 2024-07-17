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

	self assert: CMMockAnimal availablePov equals: #(defaultPOV povId).
	self assert: CMMockCow availablePov equals: #(pov defaultPOV povId).
	self assert: CMMockGoat availablePov equals: #(pov defaultPOV povId).
	self assert: CMMockCell availablePov equals: #(pov randomColor defaultPOV povId).
]

{ #category : 'tests' }
CMEntityTest >> testCollector [

	| model |
	model := (CMMockModel initialize; new)
		activeInit: #initRandom;
		createGridLines: 3
			columns: 3
			neighbourhood: 8
			closed: true;
		initializeSimulation;
		yourself.
	self assert: (model collector isKindOf: CMCollector).

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
		createGridLines: 3
			columns: 3
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
