Class {
	#name : #CMCellsLoaderTest,
	#superclass : #TestCase,
	#instVars : [
		'loader'
	],
	#category : #'Cormas-Tests'
}

{ #category : #private }
CMCellsLoaderTest >> newTestModel [
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

{ #category : #running }
CMCellsLoaderTest >> setUp [
	super setUp.
	loader := CMCellsLoader new
]

{ #category : #tests }
CMCellsLoaderTest >> testAttributeTypeValues [
	| model |
	model := self newTestModel.
	loader spaceModel: model spaceModel.
	loader
		attribute: 'state'
		type: 'Symbol'
		values: (Array new: 20 withAll: (Array new: 10 withAll: 'alive')).
	model theCells do: [ :cell | self assert: cell state equals: #alive ].
	loader
		attribute: 'state'
		type: 'Symbol'
		values: (Array new: 20 withAll: (Array new: 10 withAll: 'dead')).
	model theCells do: [ :cell | self assert: cell state equals: #dead ]
]

{ #category : #tests }
CMCellsLoaderTest >> testClosed [
	| model |
	model := self newTestModel.
	loader spaceModel: model spaceModel.
	loader closed: 'true'.
	self assert: model spaceModel closed equals: true.
	loader closed: 'false'.
	self assert: model spaceModel closed equals: false.
	self should: [ loader closed: 'error' ] raise: Error
]

{ #category : #tests }
CMCellsLoaderTest >> testConnectivity [
	| model |
	model := self newTestModel.
	loader spaceModel: model spaceModel.
	loader connectivity: 'three'.
	self assert: model spaceModel nbNeighbours equals: #three.
	loader connectivity: 'four'.
	self assert: model spaceModel nbNeighbours equals: #four.
	loader connectivity: 'six'.
	self assert: model spaceModel nbNeighbours equals: #six.
	loader connectivity: 'eight'.
	self assert: model spaceModel nbNeighbours equals: #eight.
	loader connectivity: '3'.
	self assert: model spaceModel nbNeighbours equals: #three.
	loader connectivity: '4'.
	self assert: model spaceModel nbNeighbours equals: #four.
	loader connectivity: '6'.
	self assert: model spaceModel nbNeighbours equals: #six.
	loader connectivity: '8'.
	self assert: model spaceModel nbNeighbours equals: #eight
]

{ #category : #tests }
CMCellsLoaderTest >> testDefaultClosed [
	self assert: loader defaultClosed equals: 'true'.
	loader defaultClosed: 'false'.
	self assert: loader defaultClosed equals: 'false'
]

{ #category : #tests }
CMCellsLoaderTest >> testDefaultConnectivity [
	self assert: loader defaultConnectivity equals: 'four'.
	loader defaultConnectivity: 'eight'.
	self assert: loader defaultConnectivity equals: 'eight'
]

{ #category : #tests }
CMCellsLoaderTest >> testDimensions [
	| model |
	model := self newTestModel.
	loader spaceModel: model spaceModel.
	loader dimensions: #(10 20).
	self assert: model spaceModel line equals: 10.
	self assert: model spaceModel column equals: 20.
	loader dimensions: #(20 10).
	self assert: model spaceModel line equals: 20.
	self assert: model spaceModel column equals: 10
]

{ #category : #tests }
CMCellsLoaderTest >> testIsStrict [
	loader isStrict: false.
	self assert: loader isStrict equals: false.
	self shouldnt: [ loader warning: 'test' ] raise: Error.
	loader isStrict: true.
	self assert: loader isStrict equals: true.
	self should: [ loader warning: 'test' ] raise: Error
]

{ #category : #tests }
CMCellsLoaderTest >> testSetStrict [
	loader setStrict.
	self assert: loader isStrict equals: true.
	self should: [ loader warning: 'test' ] raise: Error
]

{ #category : #tests }
CMCellsLoaderTest >> testSpaceModel [
	| spaceModel |
	spaceModel := CMSpaceModel new.
	loader spaceModel: spaceModel.
	self assert: loader spaceModel identicalTo: spaceModel
]

{ #category : #tests }
CMCellsLoaderTest >> testSpaceModelDo [
	| spaceModel count |
	spaceModel := CMSpaceModel new.
	count := 0.
	loader
		spaceModel: spaceModel;
		spaceModelDo: [ :sm | 
			self assert: sm identicalTo: spaceModel.
			count := count + 1 ].
	self assert: count equals: 1
]

{ #category : #tests }
CMCellsLoaderTest >> testUnsetStrict [
	loader unsetStrict.
	self assert: loader isStrict equals: false.
	self shouldnt: [ loader warning: 'test' ] raise: Error
]

{ #category : #tests }
CMCellsLoaderTest >> testWarning [
	loader isStrict: false.
	self shouldnt: [ loader warning: 'test' ] raise: Error.
	loader isStrict: true.
	self should: [ loader warning: 'test' ] raise: Error
]
