Class {
	#name : #CMAbstractModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Cormas-Tests'
}

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> newTestModel [
	^ (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;
		initSimulation
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> setUp [ 

	super setUp.
	model := self newTestModel.
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testCentralCell [
	| model |
	model := (CormasModelForTest
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
	self
		assert: model centralCell
		identicalTo: (model selectCellsOfColumn: 2) second
]

{ #category : #tests }
CMAbstractModelTest >> testCreateGridXYNeighborHoodClosed [

	self assert: model allTheEntities size equals: 200.
	self assert: (model selectCellsOfColumn: 1) size equals: 20.
	self assert: (model selectCellsOfLine: 1) size equals: 10
]

{ #category : #tests }
CMAbstractModelTest >> testDominance [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initRandom;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 100
			columns: 100
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: (model dominance: #state) < 1.0.

]

{ #category : #tests }
CMAbstractModelTest >> testDominance1 [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 100
			columns: 100
			neighbourhood: 4
			closed: true;
		initSimulation.
	self assert: (model dominance: #state) < 1.0
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testLowerLeftCell [
	| model |
	model := (CormasModelForTest
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
	self
		assert: model lowerLeftCell
		identicalTo: (model selectCellsOfColumn: 1) third
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testLowerRightCell [
	| model |
	model := (CormasModelForTest
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
	self
		assert: model lowerRightCell
		identicalTo: (model selectCellsOfColumn: 3) third
]

{ #category : #tests }
CMAbstractModelTest >> testNbDistinctValuesOf [

	self assert: (model nbDistinctValuesOf: #state) equals: 1.
	(model selectCellsOfLine: 1) do: [ :cell | cell state: #dead ].
	self assert: (model nbDistinctValuesOf: #state) equals: 2.
	(model selectCellsOfLine: 2) first state: #theThirdState.
	self assert: (model nbDistinctValuesOf: #state) equals: 3
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickCell [
	| cell |

	cell := model pickCell.
	self assert: cell isSpatialEntity.
	self assert: (cell numCol between: 1 and: 10).
	self assert: (cell numLine between: 1 and: 20)
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickCellConstrainedBy [
	| model |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initRandom;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 9
			columns: 9
			neighbourhood: 4
			closed: true;
		initSimulation.
	model centralCell state: #alive.
	self
		assert: (model pickCellConstrainedBy: [ :cell | cell state = #alive ]) state
		equals: #alive.
	model centralCell state: #dead.
	self
		assert: (model pickCellConstrainedBy: [ :cell | cell state = #dead ]) state
		equals: #dead
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickCellWithoutAny [

	model createN: 50 randomlyLocatedAloneEntities: CMAgentLocationForTest.
	self assert: ((model pickCellWithoutAny: CMAgentLocationForTest)
				occupantsAt: CMAgentLocationForTest) isEmpty
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickCellsN [

	self assert: ((model pickCellsN: 5) allSatisfy: #isSpatialEntity)
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickEntity [

	self assert: (model pickEntity: CMCellForTest) isSpatialEntity
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickEntityConstrainedBy [

	self
		assert:
			(model
				pickEntity: CMCellForTest
				constrainedBy: [ :cell | cell numCol = 3 ]) numCol
		equals: 3.
	self
		assert:
			(model
				pickEntity: CMCellForTest
				constrainedBy: [ :cell | cell numCol = 6 ]) numCol
		equals: 6.
	self
		assert:
			(model
				pickEntity: CMCellForTest
				constrainedBy: [ :cell | cell numCol = 9 ]) numCol
		equals: 9
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickNEntities [

	self
		assert:
			((model pickN: 5 entities: CMCellForTest) allSatisfy: #isSpatialEntity)
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickNEntitiesConstrainedBy [

	self
		assert:
			((model
				pickN: 5
				entities: CMCellForTest
				constrainedBy: [ :cell | cell numCol = 5 ])
				allSatisfy: [ :cell | cell numCol = 5 ])
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testPickUnoccupiedCell [

	model createN: 50 randomlyLocatedAloneEntities: CMAgentLocationForTest.
	self assert: model pickUnoccupiedCell theOccupants isEmpty
]

{ #category : #tests }
CMAbstractModelTest >> testProbes [
	self
		assert: CormasModelForTest probes asSet
		equals: (Set with: #numAlives with: #numDeads)
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsBetweenLine1Line2AndColumn1Column2 [
	| model cells |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;
		initSimulation.
	cells := model
		selectCellsBetweenLine1: 13
		line2: 15
		andColumn1: 6
		column2: 8.
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsInRectangleOriginCellCornerCell [
	| model cells |
	model := (CormasModelForTest
		initialize;
		new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 9
			columns: 5
			neighbourhood: 4
			closed: true;
		initSimulation.
	cells := model
		selectCellsInRectangleOriginCell: model upperLeftCell
		cornerCell: model centralCell.
	self assert: cells size equals: 15.
	cells
		do: [ :cell | 
			self assert: (cell numCol between: 1 and: 3).
			self assert: (cell numLine between: 1 and: 5) ]
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsOfColumn [

	self assert: model allTheEntities size equals: 200.
	1 to: 10 do: [ :column | 
		1 to: 20 do: [ :line | 
			self
				assert: ((model selectCellsOfColumn: column) at: line)
				identicalTo: ((model selectCellsOfLine: line) at: column) ] ]
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testSelectCellsOfLine [

	self assert: model allTheEntities size equals: 200.
	1 to: 20 do: [ :line | 
		| cells |
		cells := model selectCellsOfLine: line.
		self assert: cells size equals: 10.
		cells do: [ :cell | self assert: cell numLine equals: line ] ]
]

{ #category : #tests }
CMAbstractModelTest >> testShortName [
	"simplify the accessors in the cormas class models by removing the 
	in CMModelNameModel an entitie is theEntitys and not theCMModelNameModelEntitys
	An other method will create the entity"
	self assert: (CMConwayModel shortName ) equals: #('Cell') asOrderedCollection
]

{ #category : #tests }
CMAbstractModelTest >> testShortestDistanceToCellsVerifying [
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
CMAbstractModelTest >> testSpacialClasses [
	self
		assert: CormasModelForTest spatialClasses
		equals: (Set with: CMCellForTest)
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testTheAgents [
	| agents |
	model createN: 50 randomlyLocatedAloneEntities: CMAgentLocationForTest.
	agents := model theAgents.
	self assert: agents size equals: 50.
	agents
		do:
			[ :agent | self assert: agent class identicalTo: CMAgentLocationForTest ]
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testUpperLeftCell [
	| model |
	model := (CormasModelForTest
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
	self
		assert: model upperLeftCell
		identicalTo: (model selectCellsOfColumn: 1) first
]

{ #category : #'tests-accessing-entities' }
CMAbstractModelTest >> testUpperRightCell [
	| model |
	model := (CormasModelForTest
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
	self
		assert: model upperRightCell
		identicalTo: (model selectCellsOfColumn: 3) first
]
