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
CMBlInteractionTest >> cellLeftClickedAt: aPoint [

	| clicked |
	element whenLeftClickOnCellDo: [ :cell | clicked := cell ].
	self click: BlMouseButton primary at: aPoint.
	^ clicked
]

{ #category : 'private' }
CMBlInteractionTest >> click: aMouseButton at: aPoint [
	"Click at a point of the grid, which is not always the center of an element"

	| position |
	position := element localPointToGlobal: aPoint.
	element eventSimulator events: {
			((BlMouseDownEvent button: aMouseButton)
				 position: position;
				 yourself).
			((BlMouseUpEvent button: aMouseButton)
				 position: position;
				 yourself) }.
	space settle
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
CMBlInteractionTest >> dragFrom: aPoint by: aDelta [
	"Drag from a point of the grid, which is not always the center of an element"

	| start end |
	start := element localPointToGlobal: aPoint.
	end := element localPointToGlobal: aPoint + aDelta.
	element eventSimulator events: {
			(BlMouseDownEvent primary
				 position: start;
				 yourself).
			(BlMouseMoveEvent primary
				 position: end;
				 delta: end - start;
				 yourself).
			(BlMouseUpEvent primary
				 position: end;
				 yourself) }.
	space settle.
	space settle
]

{ #category : 'private' }
CMBlInteractionTest >> entityRightClickedAt: aPoint [

	| clicked |
	element whenRightClickOnEntityDo: [ :entity | clicked := entity ].
	self click: BlMouseButton secondary at: aPoint.
	^ clicked
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
CMBlInteractionTest >> showDiagonalRoad [
	"From 48@16 to 112@80, with its bounding box covering 0@0 to 112@80"

	^ self
		  showRoadFrom: (model cellAt: 1 at: 2)
		  to: (model cellAt: 3 at: 4)
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testDraggingALinePansAndDoesNotMoveIt [

	| road before |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).
	before := element localPointToGlobal: 0 @ 0.

	self dragFrom: 90 @ 48 by: 20 @ 0.

	self assert: (element localPointToGlobal: 0 @ 0) x > before x.
	self assert: (self lineElementOf: road) startPoint equals: 80 @ 48.
	self assert: (self lineElementOf: road) endPoint equals: 112 @ 48
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testDroppingAnAgentOnALineAboveAnAggregateLandsOnTheCellUnderneath [

	self openGrid: 4.
	self coverGridWithAnAggregate.
	self
		showRoadFrom: (model cellAt: 3 at: 1)
		to: (model cellAt: 3 at: 4).

	self drag: self agentElement by: 16 @ 32.

	self assert: cow cell equals: (model cellAt: 3 at: 3)
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testDroppingAnAgentOnALineLandsOnTheCellUnderneath [

	| road |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 3 at: 1)
		        to: (model cellAt: 3 at: 4).

	self drag: self agentElement by: 16 @ 32.

	self assert: cow cell equals: (model cellAt: 3 at: 3).
	self assert: (self lineElementOf: road) startPoint equals: 16 @ 80
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testLeftClickOnALineAboveAnAggregateReachesTheCellUnderneath [

	self openGrid: 4.
	self coverGridWithAnAggregate.
	self
		showRoadFrom: (model cellAt: 2 at: 3)
		to: (model cellAt: 2 at: 4).

	self
		assert: (self cellLeftClickedAt: 90 @ 48)
		equals: (model cellAt: 2 at: 3)
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testLeftClickOnALineReachesTheCellUnderneath [

	self openGrid: 4.
	self
		showRoadFrom: (model cellAt: 2 at: 3)
		to: (model cellAt: 2 at: 4).

	self
		assert: (self cellLeftClickedAt: 90 @ 48)
		equals: (model cellAt: 2 at: 3)
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testLeftClickOnAnArrowheadReachesTheCellUnderneath [

	self openGrid: 4.
	self
		showRoadFrom: (model cellAt: 2 at: 3)
		to: (model cellAt: 2 at: 4).

	self
		assert: (self cellLeftClickedAt: 104 @ 48)
		equals: (model cellAt: 2 at: 4)
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickInTheBoundsOfADiagonalLineReachesTheCell [

	| road |
	self openGrid: 4.
	road := self showDiagonalRoad.

	self assert: (self entityRightClickedAt: 72 @ 40) equals: road.
	self
		assert: (self entityRightClickedAt: 60 @ 70)
		equals: (model cellAt: 3 at: 2)
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickNearALineReachesTheCell [

	self openGrid: 4.
	self
		showRoadFrom: (model cellAt: 2 at: 3)
		to: (model cellAt: 2 at: 4).

	self
		assert: (self entityRightClickedAt: 86 @ 58)
		equals: (model cellAt: 2 at: 3)
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnALineCallsTheBlockWithTheLink [

	| road |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 90 @ 48) equals: road
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnALineWithEndsAtTheSamePositionReachesTheAgent [

	| goat |
	self openGrid: 4.
	goat := self newCowOn: (model cellAt: 2 at: 2).
	self showRoadFrom: cow to: goat.

	self assert:
		((self entityRightClickedAt: 48 @ 48) isKindOf: CMMockCow)
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnAnAgentOnALineCallsTheBlockWithTheAgent [

	self openGrid: 4.
	self showRoadFrom: cow to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 48 @ 48) equals: cow
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnAnArrowheadCallsTheBlockWithTheLink [
	"The arrowhead of a road 8 pixels wide is 24 pixels long and as wide at its base, with its tip at 112@48"

	| road |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 94 @ 40) equals: road
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnAnInvisibleLineReachesTheCell [

	| road |
	self openGrid: 4.
	road := self showDiagonalRoad.
	road pov: road povInvisible.
	(self lineElementOf: road) refresh.

	self
		assert: (self entityRightClickedAt: 72 @ 40)
		equals: (model cellAt: 2 at: 3)
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickOnOverlappingLinesCallsTheBlockWithTheLastOne [

	| last |
	self openGrid: 4.
	self
		showRoadFrom: (model cellAt: 2 at: 3)
		to: (model cellAt: 2 at: 4).
	last := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 90 @ 48) equals: last
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

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickReachesTheThicknessOfALineAboveItsCenter [
	"The road is 8 pixels wide, centered on the row at y = 48, and this half is inside the bounds of its element"

	| road |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 86 @ 45) equals: road
]

{ #category : 'tests - links' }
CMBlInteractionTest >> testRightClickReachesTheThicknessOfALineBelowItsCenter [
	"The road is 8 pixels wide, centered on the row at y = 48, and this half is outside the bounds of its element"

	| road |
	self openGrid: 4.
	road := self
		        showRoadFrom: (model cellAt: 2 at: 3)
		        to: (model cellAt: 2 at: 4).

	self assert: (self entityRightClickedAt: 86 @ 51) equals: road
]
