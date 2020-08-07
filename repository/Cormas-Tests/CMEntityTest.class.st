"
A CormasEntityTest is a test class for testing the behavior of CormasEntity
"
Class {
	#name : #CMEntityTest,
	#superclass : #TestCase,
	#category : #'Cormas-Tests'
}

{ #category : #tests }
CMEntityTest >> testColorOfNumber [
	self assert: (CMEntity colorOfNumber: 65) equals: Color purple
]

{ #category : #tests }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

{ #category : #tests }
CMEntityTest >> testCormasModel [
	| model |
	model := (CMTestModel
		initialize;
		new)
		activeInit: #initRandom;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 3
			columns: 3
			neighbourhood: 4
			closed: true;
		yourself.
	self assert: model centralCell cormasModel identicalTo: model.
	model
		createN: 5
		randomlyLocatedAloneEntities: CMTestAgentLocation.
	model theAgents
		do: [ :agent | self assert: agent cormasModel identicalTo: model ]
]

{ #category : #tests }
CMEntityTest >> testEntityName [
	self assert: CMTestCell entityName equals: 'Cell'.
	self assert: CMTestAgentLocation entityName equals: 'AgentLocation'
]

{ #category : #tests }
CMEntityTest >> testModelClass [
	self
		assert: CMTestCell modelClass
		identicalTo: CMTestModel
]
