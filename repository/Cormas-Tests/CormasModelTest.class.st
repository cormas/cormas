Class {
	#name : #CormasModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Tests'
}

{ #category : #tests }
CormasModelTest >> testCreateGridXYNeighborHoodClosed [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 10
			Y: 20
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: model allTheEntities size equals: 200.
	self assert: (model selectCellsOfColumn: 1) size equals: 20.
	self assert: (model selectCellsOfLine: 1) size equals: 10
]

{ #category : #tests }
CormasModelTest >> testDominance [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initRandom;
		initSimulation;
		initializeSpaceModel;
		createGridX: 100
			Y: 100
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: (model dominance: #state) < 1.0.

]

{ #category : #tests }
CormasModelTest >> testDominance1 [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 100
			Y: 100
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: (model dominance: #state) < 1.0
]

{ #category : #tests }
CormasModelTest >> testNbDistinctValuesOf [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 10
			Y: 20
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: (model nbDistinctValuesOf: #state) equals: 1.
	(model selectCellsOfLine: 1) do: [ :cell | cell state: #dead ].
	self assert: (model nbDistinctValuesOf: #state) equals: 2.
	(model selectCellsOfLine: 2) first state: #theThirdState.
	self assert: (model nbDistinctValuesOf: #state) equals: 3
]

{ #category : #tests }
CormasModelTest >> testPickCell [
	| model cell |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 10
			Y: 20
			neighbourhood: 4
			closed: true;
		initSimulation.
	cell := model pickCell.
	self assert: cell isSpatialEntity.
	self assert: (cell x between: 1 and: 10).
	self assert: (cell y between: 1 and: 20)
]

{ #category : #tests }
CormasModelTest >> testProbes [
	self
		assert: CormasModelForTest probes asSet
		equals: (Set with: #numAlives with: #numDeads)
]

{ #category : #tests }
CormasModelTest >> testSelectCellsOfColumn [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 10
			Y: 20
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: model allTheEntities size equals: 200.
	1 to: 10 do: [ :column | 
		1 to: 20 do: [ :line | 
			self
				assert: ((model selectCellsOfColumn: column) at: line)
				identicalTo: ((model selectCellsOfLine: line) at: column) ] ]
]

{ #category : #tests }
CormasModelTest >> testSelectCellsOfRow [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridX: 10
			Y: 20
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: model allTheEntities size equals: 200.
	1 to: 20 do: [ :line | 
		| cells |
		cells := model selectCellsOfLine: line.
		self assert: cells size equals: 10.
		cells do: [ :cell | self assert: cell y equals: line ] ]
]

{ #category : #tests }
CormasModelTest >> testShortestDistanceToCellsVerifying [
	| model |
	model := CormasModelForTest
		initialize;
		new.
	model initSimulation.
	(model allTheEntities: CMCellForTest)
		do: [ :cell | 
			self
				assert:
					(cell
						shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ])
				equals: 1 ]
]

{ #category : #tests }
CormasModelTest >> testSpacialClasses [
	self
		assert: CormasModelForTest spatialClasses
		equals: (Set with: CMCellForTest)
]
