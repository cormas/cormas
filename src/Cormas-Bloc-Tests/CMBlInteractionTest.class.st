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

{ #category : 'running' }
CMBlInteractionTest >> coverGridWithAnAggregate [

	(model createAggregate: CMMockAggregate from: model cells) pov:
		(CMPointOfView color: Color blue).
	element update.
	space settle
]

{ #category : 'private' }
CMBlInteractionTest >> drag: anElement by: aPoint [

	anElement eventSimulator dragBy: aPoint.
	space settle.
	space settle
]

{ #category : 'private' }
CMBlInteractionTest >> dragAgentWithoutDroppingBy: aPoint [
	"Like the simulator's dragBy:, the distance is in my own coordinates, and the mouse moves in those of the space. The mouse stays down"

	| agentElement |
	agentElement := self agentElement.
	agentElement eventSimulator
		mouseDown;
		mouseMoveBy: (agentElement localBoundsToGlobal:
					 (BlBounds origin: 0.0 @ 0.0 extent: aPoint)) extent.
	space settle.
	space settle
]

{ #category : 'private' }
CMBlInteractionTest >> lineElementOf: aLink [

	^ element children detect: [ :each |
		  (each isKindOf: CMBlLinkElement) and: [ each link == aLink ] ]
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

{ #category : 'private' }
CMBlInteractionTest >> showRoadFrom: anEntity to: anotherEntity [
	"A blue road thick enough to look at, 8 pixels wide"

	| road |
	road := (model newEntity: CMMockRoad from: anEntity to: anotherEntity)
		        pov: (CMPointOfView color: Color blue size: 0.25);
		        yourself.
	element update.
	space settle.
	^ road
]

{ #category : 'running' }
CMBlInteractionTest >> tearDown [

	space ifNotNil: [
			space
				close;
				settle ].
	super tearDown
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testArrowheadFollowsAnAgentDuringADrag [
	"The tip of the arrowhead is at the cow, which goes from 48@48 to 48@80"

	| road |
	self openGrid: 4.
	road := self showRoadFrom: (model cellAt: 2 at: 4) to: cow.

	self dragAgentWithoutDroppingBy: 0 @ 32.

	self
		assert: (self lineElementOf: road) endPoint rounded
		equals: 48 @ 80
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
CMBlInteractionTest >> testDraggingACellUnderAnAggregatePans [

	| before |
	self openGrid: 4.
	self coverGridWithAnAggregate.
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
CMBlInteractionTest >> testLeftClickReachesACellUnderAnAggregate [

	| clicked |
	self openGrid: 4.
	self coverGridWithAnAggregate.
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testLineFollowsAnAgentDuringADrag [
	"The cow starts at 48@48 and the line goes to the center of the fourth cell of the row"

	| road |
	self openGrid: 4.
	road := self showRoadFrom: cow to: (model cellAt: 2 at: 4).

	self dragAgentWithoutDroppingBy: 0 @ 32.

	self
		assert: (self lineElementOf: road) startPoint rounded
		equals: 48 @ 80.
	self
		assert: (self lineElementOf: road) endPoint rounded
		equals: 112 @ 48.
	self assert: cow cell equals: (model cellAt: 2 at: 2)
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testLineFollowsAnUndirectedLinkDuringADrag [

	| friendship |
	self openGrid: 4.
	friendship := model
		              newEntity: CMMockFriendship
		              from: (model cellAt: 2 at: 4)
		              to: cow.
	element update.
	space settle.

	self dragAgentWithoutDroppingBy: 0 @ 32.

	self
		assert: (self lineElementOf: friendship) endPoint rounded
		equals: 48 @ 80
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testLineGoesBackWhenAnAgentIsDroppedOutsideTheGrid [

	| road |
	self openGrid: 4.
	road := self showRoadFrom: cow to: (model cellAt: 2 at: 4).

	self drag: self agentElement by: 0 @ 320.

	self assert: (self lineElementOf: road) startPoint equals: 48 @ 48
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testLineGoesToTheFinalPlaceAfterADrop [

	| road |
	self openGrid: 4.
	road := self showRoadFrom: cow to: (model cellAt: 2 at: 4).

	self drag: self agentElement by: 32 @ 0.

	self assert: cow cell equals: (model cellAt: 2 at: 3).
	self assert: (self lineElementOf: road) startPoint equals: 80 @ 48
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testOtherLinksDoNotMoveDuringADrag [

	| road other before |
	self openGrid: 4.
	road := self showRoadFrom: cow to: (model cellAt: 2 at: 4).
	other := self
		         showRoadFrom: (model cellAt: 1 at: 1)
		         to: (model cellAt: 3 at: 1).
	before := (self lineElementOf: other) startPoint.

	self dragAgentWithoutDroppingBy: 0 @ 32.

	self assert: (self lineElementOf: other) startPoint equals: before.
	self
		assert: (self lineElementOf: road) startPoint rounded
		equals: 48 @ 80
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

{ #category : 'tests' }
CMBlInteractionTest >> testRightClickReachesACellUnderAnAggregate [

	| clicked |
	self openGrid: 4.
	self coverGridWithAnAggregate.
	element whenRightClickOnEntityDo: [ :entity | clicked := entity ].

	(self cellElementOf: (model cellAt: 1 at: 3)) eventSimulator
		secondaryClick.
	space settle.

	self assert: clicked equals: (model cellAt: 1 at: 3)
]

{ #category : 'tests' }
CMBlInteractionTest >> testRightClickReachesAnAgentAboveAnAggregate [

	| clicked |
	self openGrid: 4.
	self coverGridWithAnAggregate.
	element whenRightClickOnEntityDo: [ :entity | clicked := entity ].

	self agentElement eventSimulator secondaryClick.
	space settle.

	self assert: clicked equals: cow
]
