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
		initSimulation.
	self assert: model centralCell cormasModel identicalTo: model.
	model
		createN: 5
		randomlyLocatedAloneEntities: CMTestAgentLocation.
	model theAgents
		do: [ :agent | self assert: agent cormasModel identicalTo: model ]
]

{ #category : #tests }
CMEntityTest >> testModelClass [
	self
		assert: CMTestCell modelClass
		identicalTo: CMTestModel
]

{ #category : #tests }
CMEntityTest >> testShortName [
	self assert: CMTestCell shortName equals: 'Cell'.
	self
		assert: CMTestAgentLocation shortName
		equals: 'AgentLocation'
]
