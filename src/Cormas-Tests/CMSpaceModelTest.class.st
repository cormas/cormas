"
A CMSpaceModelTest is a test class for testing the behavior of CMSpaceModel
"
Class {
	#name : 'CMSpaceModelTest',
	#superclass : 'TestCase',
	#category : 'Cormas-Tests-Space',
	#package : 'Cormas-Tests',
	#tag : 'Space'
}

{ #category : 'tests' }
CMSpaceModelTest >> distanceBetweenDeadCellsInModel: aModel [
	"Assumes that a model has exactly 2 dead cells (as is the case in all our pre-defined situations)"

	| deadCells cell1 cell2 |
	
	deadCells := aModel cells select: #isDeadCell.
	
	cell1 := deadCells first.
	cell2 := deadCells second.

	^ cell1 distanceTo: cell2
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4HexagonalFlatClosed [
	<script: 'self new newModel2x4HexagonalFlatClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #flat6
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4HexagonalFlatOpen [
	<script: 'self new newModel2x4HexagonalFlatOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #flat6
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4HexagonalPointyClosed [
	<script: 'self new newModel2x4HexagonalPointyClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #pointy6
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4HexagonalPointyOpen [
	<script: 'self new newModel2x4HexagonalPointyOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #pointy6
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4Square4NeighboursClosed [
	<script: 'self new newModel2x4Square4NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4Square4NeighboursOpen [
	<script: 'self new newModel2x4Square4NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 4
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4Square8NeighboursClosed [
	<script: 'self new newModel2x4Square8NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 8
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel2x4Square8NeighboursOpen [
	<script: 'self new newModel2x4Square8NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 8
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10HexagonalFlatClosed [
	<script: 'self new newModel8x10HexagonalFlatClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #flat6
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10HexagonalFlatOpen [
	<script: 'self new newModel8x10HexagonalFlatOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #flat6
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10HexagonalPointyClosed [
	<script: 'self new newModel8x10HexagonalPointyClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #pointy6
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10HexagonalPointyOpen [
	<script: 'self new newModel8x10HexagonalPointyOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #pointy6
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10Square4NeighboursClosed [
	<script: 'self new newModel8x10Square4NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10Square4NeighboursOpen [
	<script: 'self new newModel8x10Square4NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 4
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10Square8NeighboursClosed [
	<script: 'self new newModel8x10Square8NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 8
		closed: true;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> newModel8x10Square8NeighboursOpen [
	<script: 'self new newModel8x10Square8NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 8
		closed: false;
		yourself
]

{ #category : 'test' }
CMSpaceModelTest >> situation1For2x4Square4NeighboursClosed [
	<script: 'self new situation1For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation1For2x4Square4NeighboursOpen [
	<script: 'self new situation1For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation1For2x4Square8NeighboursClosed [
	<script: 'self new situation1For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation1For2x4Square8NeighboursOpen [
	<script: 'self new situation1For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation2For2x4Square4NeighboursClosed [
	<script: 'self new situation2For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation2For2x4Square4NeighboursOpen [
	<script: 'self new situation2For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation2For2x4Square8NeighboursClosed [
	<script: 'self new situation2For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation2For2x4Square8NeighboursOpen [
	<script: 'self new situation2For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation3For2x4Square4NeighboursClosed [
	<script: 'self new situation3For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation3For2x4Square4NeighboursOpen [
	<script: 'self new situation3For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation3For2x4Square8NeighboursClosed [
	<script: 'self new situation3For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation3For2x4Square8NeighboursOpen [
	<script: 'self new situation3For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation4For2x4Square4NeighboursClosed [
	<script: 'self new situation4For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation4For2x4Square4NeighboursOpen [
	<script: 'self new situation4For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation4For2x4Square8NeighboursClosed [
	<script: 'self new situation4For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'test' }
CMSpaceModelTest >> situation4For2x4Square8NeighboursOpen [
	<script: 'self new situation4For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'tests' }
CMSpaceModelTest >> testCellAtAt [
	
	| spaceModel |
	spaceModel := self newModel2x4Square4NeighboursOpen spaceModel.

	self assert: (spaceModel cellAt: 1 at: 1) id equals: 1.
	self assert: (spaceModel cellAt: 1 at: 2) id equals: 2.
	
	self assert: (spaceModel cellAt: 2 at: 1) id equals: 5.
	self assert: (spaceModel cellAt: 2 at: 4) id equals: 8.
	
]

{ #category : 'tests' }
CMSpaceModelTest >> testCellsOfLine [

	| cells spaceModel |
	
	spaceModel := self newModel2x4Square4NeighboursOpen spaceModel.
	cells := spaceModel cellsOfRow: 1.
	
	self assert: cells size equals: 4.
	
	cells withIndexDo: [ :each :i |
		self assert: (each isKindOf: CMMockCell).
		self assert: each id equals: i ].
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4Square4NeighboursClosed [

	| model |
	model := self situation1For2x4Square4NeighboursClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 4
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4Square4NeighboursOpen [

	| model |
	model := self situation1For2x4Square4NeighboursOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4Square8NeighboursClosed [

	| model |
	model := self situation1For2x4Square8NeighboursClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4Square8NeighboursOpen [

	| model |
	model := self situation1For2x4Square8NeighboursOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4Square4NeighboursClosed [

	| model |
	model := self situation2For2x4Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4Square4NeighboursOpen [

	| model |
	model := self situation2For2x4Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4Square8NeighboursClosed [

	| model |
	model := self situation2For2x4Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4Square8NeighboursOpen [

	| model |
	model := self situation2For2x4Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4Square4NeighboursClosed [

	| model |
	model := self situation3For2x4Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4Square4NeighboursOpen [

	| model |
	model := self situation3For2x4Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4Square8NeighboursClosed [

	| model |
	model := self situation3For2x4Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4Square8NeighboursOpen [

	| model |
	model := self situation3For2x4Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4Square4NeighboursClosed [

	| model |
	model := self situation4For2x4Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4Square4NeighboursOpen [

	| model |
	model := self situation4For2x4Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4Square8NeighboursClosed [

	| model |
	model := self situation4For2x4Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4Square8NeighboursOpen [

	| model |
	model := self situation4For2x4Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testIsNotTorroidal [

	self assert: self newModel2x4Square8NeighboursClosed spaceModel isClosedEnvironment.
	self deny: self newModel2x4Square8NeighboursOpen spaceModel isClosedEnvironment.	
]

{ #category : 'tests' }
CMSpaceModelTest >> testNeighbourhoodConfiguration [

	| spaceModel |
	spaceModel := self newModel2x4Square4NeighboursOpen spaceModel.

	spaceModel numberOfNeighbours: 4.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace4Neighbourhood).
	
	spaceModel numberOfNeighbours: 8.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace8Neighbourhood).
	
	spaceModel neighbourhoodConfiguration: nil.
	self assert: spaceModel neighbourhoodConfiguration isNil.
]

{ #category : 'tests' }
CMSpaceModelTest >> testNumberOfNeighbours [

	| spaceModel |
	spaceModel := self newModel2x4Square4NeighboursOpen spaceModel.

	spaceModel numberOfNeighbours: 4.
	self assert: spaceModel numberOfNeighbours equals: 4.
	
	spaceModel numberOfNeighbours: 8.
	self assert: spaceModel numberOfNeighbours equals: 8.
	


]

{ #category : 'tests' }
CMSpaceModelTest >> testNumberOfRowsNumberOfColumns [

	| spaceModel |
	spaceModel := self newModel2x4Square4NeighboursOpen spaceModel.

	spaceModel numberOfRows: 2 numberOfColumns: 3.
	self assert: spaceModel numberOfRows equals: 2.
	self assert: spaceModel numberOfColumns equals: 3.
	self assert: spaceModel gridSize equals: 6.
]
