"
I check clicking on entities and dragging agents in a space without a window, with simulated mouse events that find their target as real ones do.

## Responsibility:

- Check that clicks on cells and agents reach the blocks given to an element.
- Check that dragging an agent moves it to the cell it is dropped on, or back when it is dropped outside the grid.
- Check that dragging an agent does not pan, and that dragging anything else does.

## Collaborators: 

- `CMBlSpaceElement` and `CMBlSpaceViewport`: the elements under test.
- `BlEventSimulator`: sends the mouse events.

### Implementation Points

`BlEventSimulator` measures drags in the coordinates of its target, so distances are given at the natural size of the grid, whatever the zoom.
"
Class {
	#name : 'CMBlInteractionTest',
	#superclass : 'CMBlTestCase',
	#instVars : [
		'space',
		'element',
		'cow'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'private' }
CMBlInteractionTest >> agentElement [

	^ element children detect: [ :each | each entity == cow ]
]

{ #category : 'private' }
CMBlInteractionTest >> cellElementOf: aCell [

	^ element children detect: [ :each | each entity == aCell ]
]

{ #category : 'private' }
CMBlInteractionTest >> drag: anElement by: aPoint [

	anElement eventSimulator dragBy: aPoint.
	space settle.
	space settle
]

{ #category : 'running' }
CMBlInteractionTest >> openGrid: aNeighbourhood [

	self gridWithNeighbourhood: aNeighbourhood.
	cow := self newCowOn: (model cellAt: 2 at: 2).
	element := CMBlSpaceElement for: model.
	space := BlSpace new
		         host: BlHeadlessHost default;
		         yourself.
	space root addChild: (CMBlSpaceViewport on: element).
	space
		show;
		settle
]

{ #category : 'running' }
CMBlInteractionTest >> tearDown [

	space ifNotNil: [
			space
				close;
				settle ].
	super tearDown
]

{ #category : 'tests' }
CMBlInteractionTest >> testDraggingACellPans [

	| before |
	self openGrid: 4.
	before := element localPointToGlobal: 0 @ 0.

	self drag: (self cellElementOf: (model cellAt: 1 at: 1)) by: 20 @ 0.

	self assert: (element localPointToGlobal: 0 @ 0) x > before x
]

{ #category : 'tests' }
CMBlInteractionTest >> testDraggingAnAgentDoesNotPan [

	| before |
	self openGrid: 4.
	before := element localPointToGlobal: 0 @ 0.

	self drag: self agentElement by: 20 @ 0.

	self assert: (element localPointToGlobal: 0 @ 0) equals: before
]

{ #category : 'tests' }
CMBlInteractionTest >> testDroppingAnAgentKeepsWhereItWasDropped [
	"The cow starts in the center of its cell and moves a quarter of a cell to the right"

	self openGrid: 4.

	self drag: self agentElement by: 8 @ 0.

	self assert: cow cell equals: (model cellAt: 2 at: 2).
	self assert: (cow positionInCell x closeTo: 0.75 precision: 0.05).
	self assert: (cow positionInCell y closeTo: 0.5 precision: 0.05)
]

{ #category : 'tests' }
CMBlInteractionTest >> testDroppingAnAgentMovesItToTheCell [

	self openGrid: 4.

	self drag: self agentElement by: 32 @ 0.

	self assert: cow cell equals: (model cellAt: 2 at: 3).
	self deny: (model cellAt: 2 at: 2) hasOccupants.
	self assert: (model cellAt: 2 at: 3) hasOccupants
]

{ #category : 'tests' }
CMBlInteractionTest >> testDroppingAnAgentOnATriangleUsesTheShapeOfTheCell [
	"The boxes of neighbouring triangles overlap, so the box alone would not tell which cell it is"

	| center |
	self openGrid: 3.

	self drag: self agentElement by: 11 @ 0.

	center := self agentElement position + (self agentElement extent / 2).
	self assert: ((self cellElementOf: cow cell) containsPoint:
			 ((self cellElementOf: cow cell) parentPointToLocal: center))
]

{ #category : 'tests' }
CMBlInteractionTest >> testDroppingAnAgentOutsideTheGridPutsItBack [

	| before |
	self openGrid: 4.
	before := cow positionInCell.

	self drag: self agentElement by: 0 @ 320.

	self assert: cow cell equals: (model cellAt: 2 at: 2).
	self assert: cow positionInCell equals: before.
	self
		assert: self agentElement position + (self agentElement extent / 2)
		equals: 48 @ 48
]

{ #category : 'tests' }
CMBlInteractionTest >> testLeftClickOnAgentDoesNotCallTheBlockForCells [

	| clicked |
	self openGrid: 4.
	element whenLeftClickOnCellDo: [ :cell | clicked := cell ].

	self agentElement eventSimulator click.
	space settle.

	self assert: clicked isNil
]

{ #category : 'tests' }
CMBlInteractionTest >> testLeftClickOnCellCallsTheBlock [

	| clicked |
	self openGrid: 4.
	element whenLeftClickOnCellDo: [ :cell | clicked := cell ].

	(self cellElementOf: (model cellAt: 1 at: 3)) eventSimulator click.
	space settle.

	self assert: clicked equals: (model cellAt: 1 at: 3)
]

{ #category : 'tests' }
CMBlInteractionTest >> testLeftClickUsesTheLastBlock [

	| first second |
	self openGrid: 4.
	element whenLeftClickOnCellDo: [ :cell | first := cell ].
	element whenLeftClickOnCellDo: [ :cell | second := cell ].

	(self cellElementOf: (model cellAt: 1 at: 3)) eventSimulator click.
	space settle.

	self assert: first isNil.
	self assert: second equals: (model cellAt: 1 at: 3)
]

{ #category : 'tests' }
CMBlInteractionTest >> testRightClickOnAgentCallsTheBlock [

	| clicked |
	self openGrid: 4.
	element whenRightClickOnEntityDo: [ :entity | clicked := entity ].

	self agentElement eventSimulator secondaryClick.
	space settle.

	self assert: clicked equals: cow
]

{ #category : 'tests' }
CMBlInteractionTest >> testRightClickOnCellCallsTheBlock [

	| clicked |
	self openGrid: 4.
	element whenRightClickOnEntityDo: [ :entity | clicked := entity ].

	(self cellElementOf: (model cellAt: 1 at: 3)) eventSimulator
		secondaryClick.
	space settle.

	self assert: clicked equals: (model cellAt: 1 at: 3)
]
