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


self assert: (CMEntity colorOfNumber: 65) equals: Color lightOrange   
]

{ #category : #tests }
CMEntityTest >> testCormasEntityIsAbstract [
	self assert: CMEntity isAbstract
]

{ #category : #tests }
CMEntityTest >> testCormasModel [
	| model |
	model := (CMModelForTest
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
		randomlyLocatedAloneEntities: CMTestsAgentLocationForTest.
	model theAgents
		do: [ :agent | self assert: agent cormasModel identicalTo: model ]
]

{ #category : #tests }
CMEntityTest >> testModelClass [
	self
		assert: CMCellForTest modelClass
		identicalTo: CMModelForTest
]

{ #category : #tests }
CMEntityTest >> testRegisteredColor [
	self
		assert: Color registeredColorNames sorted
		equals:
		#('black' 'blue' 'brickDarken' 'brown' 'cyan' 'darkGray' 'gray' 'green' 'lightBlue' 'lightBrown' 'lightCyan' 'lightGray' 'lightGreen' 'lightMagenta' 'lightOrange' 'lightRed' 'lightYellow' 'magenta' 'orange' 'paleBlue' 'paleBuff' 'paleGreen' 'paleMagenta' 'paleOrange' 'palePeach' 'paleRed' 'paleTan' 'paleYellow' 'pink' 'purple' 'red' 'tan' 'transparent' 'veryDarkGray' 'veryLightGray' 'veryPaleRed' 'veryVeryDarkGray' 'veryVeryLightGray' 'white' 'yellow')
]

{ #category : #tests }
CMEntityTest >> testShortName [
	self assert: CMCellForTest shortName equals: 'CellForTest'.
	self
		assert: CMTestsAgentLocationForTest shortName
		equals: 'AgentLocationForTest'
]
