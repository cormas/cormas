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

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4HexagonalFlatClosed [
	<script: 'self new newModel2x4HexagonalFlatClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #flat6
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4HexagonalFlatOpen [
	<script: 'self new newModel2x4HexagonalFlatOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #flat6
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4HexagonalPointyClosed [
	<script: 'self new newModel2x4HexagonalPointyClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #pointy6
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4HexagonalPointyOpen [
	<script: 'self new newModel2x4HexagonalPointyOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: #pointy6
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4Square4NeighboursClosed [
	<script: 'self new newModel2x4Square4NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4Square4NeighboursOpen [
	<script: 'self new newModel2x4Square4NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 4
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4Square8NeighboursClosed [
	<script: 'self new newModel2x4Square8NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 8
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel2x4Square8NeighboursOpen [
	<script: 'self new newModel2x4Square8NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 2
		numberOfColumns: 4
		neighbourhood: 8
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10HexagonalFlatClosed [
	<script: 'self new newModel8x10HexagonalFlatClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #flat6
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10HexagonalFlatOpen [
	<script: 'self new newModel8x10HexagonalFlatOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #flat6
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10HexagonalPointyClosed [
	<script: 'self new newModel8x10HexagonalPointyClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #pointy6
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10HexagonalPointyOpen [
	<script: 'self new newModel8x10HexagonalPointyOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: #pointy6
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10Square4NeighboursClosed [
	<script: 'self new newModel8x10Square4NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 4
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10Square4NeighboursOpen [
	<script: 'self new newModel8x10Square4NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 4
		closed: false;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10Square8NeighboursClosed [
	<script: 'self new newModel8x10Square8NeighboursClosed openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 8
		closed: true;
		yourself
]

{ #category : 'models' }
CMSpaceModelTest >> newModel8x10Square8NeighboursOpen [
	<script: 'self new newModel8x10Square8NeighboursOpen openSpacePresenter'>

	^ CMMockModel new 
		createGridNumberOfRows: 8
		numberOfColumns: 10
		neighbourhood: 8
		closed: false;
		yourself
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4HexagonalFlatClosed [
	<script: 'self new situation1For2x4HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4HexagonalFlatOpen [
	<script: 'self new situation1For2x4HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4HexagonalPointyClosed [
	<script: 'self new situation1For2x4HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4HexagonalPointyOpen [
	<script: 'self new situation1For2x4HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4Square4NeighboursClosed [
	<script: 'self new situation1For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4Square4NeighboursOpen [
	<script: 'self new situation1For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4Square8NeighboursClosed [
	<script: 'self new situation1For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For2x4Square8NeighboursOpen [
	<script: 'self new situation1For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 4) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10HexagonalFlatClosed [
	<script: 'self new situation1For8x10HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatClosed.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10HexagonalFlatOpen [
	<script: 'self new situation1For8x10HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatOpen.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10HexagonalPointyClosed [
	<script: 'self new situation1For8x10HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyClosed.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10HexagonalPointyOpen [
	<script: 'self new situation1For8x10HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyOpen.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10Square4NeighboursClosed [
	<script: 'self new situation1For8x10Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursClosed.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10Square4NeighboursOpen [
	<script: 'self new situation1For8x10Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursOpen.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10Square8NeighboursClosed [
	<script: 'self new situation1For8x10Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursClosed.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation1For8x10Square8NeighboursOpen [
	<script: 'self new situation1For8x10Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursOpen.
	
	(model cellAt: 7 at: 2) initDead.
	(model cellAt: 2 at: 9) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4HexagonalFlatClosed [
	<script: 'self new situation2For2x4HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4HexagonalFlatOpen [
	<script: 'self new situation2For2x4HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4HexagonalPointyClosed [
	<script: 'self new situation2For2x4HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4HexagonalPointyOpen [
	<script: 'self new situation2For2x4HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4Square4NeighboursClosed [
	<script: 'self new situation2For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4Square4NeighboursOpen [
	<script: 'self new situation2For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4Square8NeighboursClosed [
	<script: 'self new situation2For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For2x4Square8NeighboursOpen [
	<script: 'self new situation2For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 2) initDead.
	(model cellAt: 2 at: 3) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10HexagonalFlatClosed [
	<script: 'self new situation2For8x10HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatClosed.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10HexagonalFlatOpen [
	<script: 'self new situation2For8x10HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatOpen.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10HexagonalPointyClosed [
	<script: 'self new situation2For8x10HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyClosed.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10HexagonalPointyOpen [
	<script: 'self new situation2For8x10HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyOpen.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10Square4NeighboursClosed [
	<script: 'self new situation2For8x10Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursClosed.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10Square4NeighboursOpen [
	<script: 'self new situation2For8x10Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursOpen.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10Square8NeighboursClosed [
	<script: 'self new situation2For8x10Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursClosed.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation2For8x10Square8NeighboursOpen [
	<script: 'self new situation2For8x10Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursOpen.
	
	(model cellAt: 3 at: 4) initDead.
	(model cellAt: 6 at: 7) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4HexagonalFlatClosed [
	<script: 'self new situation3For2x4HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4HexagonalFlatOpen [
	<script: 'self new situation3For2x4HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4HexagonalPointyClosed [
	<script: 'self new situation3For2x4HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4HexagonalPointyOpen [
	<script: 'self new situation3For2x4HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4Square4NeighboursClosed [
	<script: 'self new situation3For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4Square4NeighboursOpen [
	<script: 'self new situation3For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4Square8NeighboursClosed [
	<script: 'self new situation3For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For2x4Square8NeighboursOpen [
	<script: 'self new situation3For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 2 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10HexagonalFlatClosed [
	<script: 'self new situation3For8x10HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10HexagonalFlatOpen [
	<script: 'self new situation3For8x10HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10HexagonalPointyClosed [
	<script: 'self new situation3For8x10HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10HexagonalPointyOpen [
	<script: 'self new situation3For8x10HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10Square4NeighboursClosed [
	<script: 'self new situation3For8x10Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10Square4NeighboursOpen [
	<script: 'self new situation3For8x10Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10Square8NeighboursClosed [
	<script: 'self new situation3For8x10Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursClosed.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation3For8x10Square8NeighboursOpen [
	<script: 'self new situation3For8x10Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursOpen.
	
	(model cellAt: 1 at: 1) initDead.
	(model cellAt: 8 at: 1) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4HexagonalFlatClosed [
	<script: 'self new situation4For2x4HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4HexagonalFlatOpen [
	<script: 'self new situation4For2x4HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalFlatOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4HexagonalPointyClosed [
	<script: 'self new situation4For2x4HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4HexagonalPointyOpen [
	<script: 'self new situation4For2x4HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel2x4HexagonalPointyOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4Square4NeighboursClosed [
	<script: 'self new situation4For2x4Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4Square4NeighboursOpen [
	<script: 'self new situation4For2x4Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square4NeighboursOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4Square8NeighboursClosed [
	<script: 'self new situation4For2x4Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursClosed.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For2x4Square8NeighboursOpen [
	<script: 'self new situation4For2x4Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel2x4Square8NeighboursOpen.
	
	(model cellAt: 2 at: 1) initDead.
	(model cellAt: 2 at: 4) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10HexagonalFlatClosed [
	<script: 'self new situation4For8x10HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatClosed.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10HexagonalFlatOpen [
	<script: 'self new situation4For8x10HexagonalFlatOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatOpen.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10HexagonalPointyClosed [
	<script: 'self new situation4For8x10HexagonalPointyClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyClosed.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10HexagonalPointyOpen [
	<script: 'self new situation4For8x10HexagonalPointyOpen openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalPointyOpen.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10Square4NeighboursClosed [
	<script: 'self new situation4For8x10Square4NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursClosed.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10Square4NeighboursOpen [
	<script: 'self new situation4For8x10Square4NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square4NeighboursOpen.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10Square8NeighboursClosed [
	<script: 'self new situation4For8x10Square8NeighboursClosed openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursClosed.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation4For8x10Square8NeighboursOpen [
	<script: 'self new situation4For8x10Square8NeighboursOpen openSpacePresenter'>

	| model |
	model := self newModel8x10Square8NeighboursOpen.
	
	(model cellAt: 8 at: 1) initDead.
	(model cellAt: 8 at: 10) initDead.
	
	^ model
]

{ #category : 'situations' }
CMSpaceModelTest >> situation5For8x10HexagonalFlatClosed [
	<script: 'self new situation5For8x10HexagonalFlatClosed openSpacePresenter'>

	| model |
	model := self newModel8x10HexagonalFlatClosed.
	
	(model cellAt: 6 at: 4) initDead.
	(model cellAt: 3 at: 7) initDead.
	
	^ model
]

{ #category : 'tests' }
CMSpaceModelTest >> testAxialCoordinates2x4HexagonalPointyClosed [

	| expectedCoordinates model offsetCoordinates axialCoordinates |
	
	"Row 0: (0,0)→(0,0), (0,1)→(1,0), (0,2)→(2,0), (0,3)→(3,0)
	 Row 1: (1,0)→(0,1), (1,1)→(1,1), (1,2)→(2,1), (1,3)→(3,1)"
	expectedCoordinates := OrderedCollection withAll: {
		0@0 . 1@0 . 2@0 . 3@0 .
		0@1 . 1@1 . 2@1 . 3@1 }.
		
	model := self newModel2x4HexagonalPointyClosed.
	
	axialCoordinates := model cells collect: [ :each |
		offsetCoordinates := each rowNumber @ each columnNumber.
		model spaceModel neighbourhoodConfiguration offsetCoordinatesToAxial: offsetCoordinates ].
	
	self assertCollection: axialCoordinates equals: expectedCoordinates 
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
CMSpaceModelTest >> testDistanceSituation1For2x4HexagonalFlatClosed [

	| model |
	model := self situation1For2x4HexagonalFlatClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4HexagonalFlatOpen [

	| model |
	model := self situation1For2x4HexagonalFlatOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4HexagonalPointyClosed [

	| model |
	model := self situation1For2x4HexagonalPointyClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For2x4HexagonalPointyOpen [

	| model |
	model := self situation1For2x4HexagonalPointyOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
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
CMSpaceModelTest >> testDistanceSituation1For8x10HexagonalFlatClosed [

	| model |
	model := self situation1For8x10HexagonalFlatClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 9
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10HexagonalFlatOpen [

	| model |
	model := self situation1For8x10HexagonalFlatOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 4
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10HexagonalPointyClosed [

	| model |
	model := self situation1For8x10HexagonalPointyClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 10
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10HexagonalPointyOpen [

	| model |
	model := self situation1For8x10HexagonalPointyOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 4
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10Square4NeighboursClosed [

	| model |
	model := self situation1For8x10Square4NeighboursClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 12
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10Square4NeighboursOpen [

	| model |
	model := self situation1For8x10Square4NeighboursOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 6
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10Square8NeighboursClosed [

	| model |
	model := self situation1For8x10Square8NeighboursClosed.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 7
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation1For8x10Square8NeighboursOpen [

	| model |
	model := self situation1For8x10Square8NeighboursOpen.

	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4HexagonalFlatClosed [

	| model |
	model := self situation2For2x4HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4HexagonalFlatOpen [

	| model |
	model := self situation2For2x4HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4HexagonalPointyClosed [

	| model |
	model := self situation2For2x4HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For2x4HexagonalPointyOpen [

	| model |
	model := self situation2For2x4HexagonalPointyOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 2
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
CMSpaceModelTest >> testDistanceSituation2For8x10HexagonalFlatClosed [

	| model |
	model := self situation2For8x10HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 4
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10HexagonalFlatOpen [

	| model |
	model := self situation2For8x10HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 4
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10HexagonalPointyClosed [

	| model |
	model := self situation2For8x10HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 5
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10HexagonalPointyOpen [

	| model |
	model := self situation2For8x10HexagonalPointyOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 5
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10Square4NeighboursClosed [

	| model |
	model := self situation2For8x10Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 6
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10Square4NeighboursOpen [

	| model |
	model := self situation2For8x10Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 6
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10Square8NeighboursClosed [

	| model |
	model := self situation2For8x10Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation2For8x10Square8NeighboursOpen [

	| model |
	model := self situation2For8x10Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4HexagonalFlatClosed [

	| model |
	model := self situation3For2x4HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4HexagonalFlatOpen [

	| model |
	model := self situation3For2x4HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4HexagonalPointyClosed [

	| model |
	model := self situation3For2x4HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For2x4HexagonalPointyOpen [

	| model |
	model := self situation3For2x4HexagonalPointyOpen.
	
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
CMSpaceModelTest >> testDistanceSituation3For8x10HexagonalFlatClosed [

	| model |
	model := self situation3For8x10HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 7
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10HexagonalFlatOpen [

	| model |
	model := self situation3For8x10HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10HexagonalPointyClosed [

	| model |
	model := self situation3For8x10HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 7
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10HexagonalPointyOpen [

	| model |
	model := self situation3For8x10HexagonalPointyOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10Square4NeighboursClosed [

	| model |
	model := self situation3For8x10Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 7
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10Square4NeighboursOpen [

	| model |
	model := self situation3For8x10Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10Square8NeighboursClosed [

	| model |
	model := self situation3For8x10Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 7
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation3For8x10Square8NeighboursOpen [

	| model |
	model := self situation3For8x10Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4HexagonalFlatClosed [

	| model |
	model := self situation4For2x4HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4HexagonalFlatOpen [

	| model |
	model := self situation4For2x4HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4HexagonalPointyClosed [

	| model |
	model := self situation4For2x4HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 3
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For2x4HexagonalPointyOpen [

	| model |
	model := self situation4For2x4HexagonalPointyOpen.
	
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
CMSpaceModelTest >> testDistanceSituation4For8x10HexagonalFlatClosed [

	| model |
	model := self situation4For8x10HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 9
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10HexagonalFlatOpen [

	| model |
	model := self situation4For8x10HexagonalFlatOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10HexagonalPointyClosed [

	| model |
	model := self situation4For8x10HexagonalPointyClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 9
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10HexagonalPointyOpen [

	| model |
	model := self situation4For8x10HexagonalPointyOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10Square4NeighboursClosed [

	| model |
	model := self situation4For8x10Square4NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 9
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10Square4NeighboursOpen [

	| model |
	model := self situation4For8x10Square4NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10Square8NeighboursClosed [

	| model |
	model := self situation4For8x10Square8NeighboursClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 9
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation4For8x10Square8NeighboursOpen [

	| model |
	model := self situation4For8x10Square8NeighboursOpen.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 1
]

{ #category : 'tests' }
CMSpaceModelTest >> testDistanceSituation5For8x10HexagonalFlatClosed [

	| model |
	model := self situation5For8x10HexagonalFlatClosed.
	
	self 
		assert: (self distanceBetweenDeadCellsInModel: model)
		equals: 5
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
	
	spaceModel numberOfNeighbours: 3.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace3Neighbourhood).
	
	spaceModel numberOfNeighbours: 6.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace6NeighbourhoodPointyTop).
	
	spaceModel numberOfNeighbours: #pointy6.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace6NeighbourhoodPointyTop).
	
	spaceModel numberOfNeighbours: #flat6.
	self assert: (spaceModel neighbourhoodConfiguration isKindOf: CMSpace6NeighbourhoodFlatTop).
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
