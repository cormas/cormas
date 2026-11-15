"
I am the abstract root of the Bloc elements that draw Cormas models and entities.

## Responsibility:

- Define the size of a cell, in pixels, and where a cell sits on its grid.
- Refresh my subclasses safely, whichever process asks for it.

## Collaborators:

- `CMSpaceNeighbourhood`: answers the geometry of the grid.

## Public API and Key Messages

- `update` makes me show the current state of what I draw. Nothing updates me automatically.
- Subclasses implement `refresh`, and are created with `for:`.

## Internal Representation

### Implementation Points

Elements that are attached to a space may only be changed from the process of that space, while simulations run in another process. This is why `update` goes through the space when I am attached.

## Interaction

- `whenLeftClickOnCellDo:` and `whenRightClickOnEntityDo:` let my clients react to clicks on what I show
- `entity` answers the cell or agent that a click on me is about, if any
"
Class {
	#name : 'CMBlElement',
	#superclass : 'BlElement',
	#instVars : [
		'leftClickBlock',
		'rightClickBlock',
		'observer',
		'aspectsChangedBlock'
	],
	#classInstVars : [
		'composedTiles'
	],
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'accessing' }
CMBlElement class >> cellSize [
	"Answer the size, in pixels, of the longest side of the box around a cell"

	^ 32
]

{ #category : 'tiles' }
CMBlElement class >> composedTiles [

	^ composedTiles ifNil: [ composedTiles := Dictionary new ]
]

{ #category : 'instance creation' }
CMBlElement class >> for: anObject [
	"Answer an element that shows anObject with the default aspects"

	^ self for: anObject observedBy: CMObserver new
]

{ #category : 'instance creation' }
CMBlElement class >> for: anObject observedBy: anObserver [
	"Answer an element that shows anObject with the looks that anObserver fills"

	^ self new
		  observer: anObserver;
		  setUpFor: anObject;
		  yourself
]

{ #category : 'tiles' }
CMBlElement class >> tileOfLook: aLook [
	"Answer the tile drawn for a look: its tile, with its overlays laid over it. Composing tiles is slow, so each combination is composed once"

	^ self composedTiles
		  at: {
				  aLook tile.
				  aLook overlays }
		  ifAbsentPut: [
				  aLook overlays
					  inject: (CMTileset tileNamed: aLook tile)
					  into: [ :tile :each |
						  tile
							  add: (CMTileset tileNamed: each key)
							  scaledDownTo: each value ] ]
]

{ #category : 'drawing' }
CMBlElement >> backgroundOfLook: aLook in: aSpaceModel extent: anExtent [
	"Answer the color or the image with which a look fills an element of the given extent"

	aLook hasTile ifFalse: [ ^ aLook color ].
	^ BlBackground image: (self
			   crop:
				   ((self
					     formOfTile: (self class tileOfLook: aLook)
					     in: aSpaceModel) scaledToSize: anExtent max ceiling asPoint)
			   toCenter: anExtent)
]

{ #category : 'geometry' }
CMBlElement >> cellExtentOf: aCell [
	"Answer the extent in pixels of the box around aCell"

	^ (self neighbourhoodOf: aCell) cellProportions * self cellSize
]

{ #category : 'geometry' }
CMBlElement >> cellSize [

	^ self class cellSize
]

{ #category : 'drawing' }
CMBlElement >> crop: aSquareForm toCenter: anExtent [

	| origin |
	origin := (aSquareForm extent - anExtent / 2) rounded.
	^ aSquareForm copy: (origin extent: anExtent ceiling)
]

{ #category : 'accessing' }
CMBlElement >> drawnKey [
	"Answer what I draw, so that a space element can keep me across its refreshes"

	^ self entity
]

{ #category : 'interaction' }
CMBlElement >> entity [
	"Answer the entity that a click on me is about, if any"

	^ nil
]

{ #category : 'interaction' }
CMBlElement >> entityTargetedBy: anEvent [
	"Answer the entity of the deepest element under me that the event is aimed at"

	| target |
	target := anEvent target.
	[ target isNil ] whileFalse: [
			target entity ifNotNil: [ :entity | ^ entity ].
			target == self ifTrue: [ ^ nil ].
			target := target parent ].
	^ nil
]

{ #category : 'drawing' }
CMBlElement >> formOfTile: aTile in: aSpaceModel [
	"The cells of a smaller grid are shown larger on screen, so they need a larger form"

	| gridSize |
	aSpaceModel ifNil: [ ^ aTile largeForm ].
	gridSize := aSpaceModel dimensions max.
	gridSize < 5 ifTrue: [ ^ aTile largeForm ].
	gridSize < 10 ifTrue: [ ^ aTile mediumForm ].
	gridSize < 15 ifTrue: [ ^ aTile smallForm ].
	^ aTile verySmallForm
]

{ #category : 'geometry' }
CMBlElement >> gridPositionOfCell: aCell [
	"Answer the top-left corner in pixels of the box around aCell, on a grid starting at 0@0"

	^ ((self neighbourhoodOf: aCell) relativeOriginOfCell: aCell)
	  * (self cellExtentOf: aCell)
]

{ #category : 'interaction' }
CMBlElement >> handleLeftClick: anEvent [

	(self entityTargetedBy: anEvent) ifNotNil: [ :entity |
			entity isSpatialEntity ifTrue: [
					anEvent consume.
					leftClickBlock value: entity ] ]
]

{ #category : 'interaction' }
CMBlElement >> handleRightClick: anEvent [

	(self entityTargetedBy: anEvent) ifNotNil: [ :entity |
			anEvent consume.
			rightClickBlock value: entity ]
]

{ #category : 'updating' }
CMBlElement >> inSpaceDo: aBlock [
	"Elements in a space may only change from the process of that space, while my clients may run in the process of a simulation"

	self isAttachedToSceneGraph
		ifTrue: [ self space defer: aBlock ]
		ifFalse: aBlock
]

{ #category : 'initialization' }
CMBlElement >> initialize [

	super initialize.
	aspectsChangedBlock := [ self update ]
]

{ #category : 'geometry' }
CMBlElement >> neighbourhoodOf: aCell [

	^ aCell spaceModel neighbourhoodConfiguration
]

{ #category : 'accessing' }
CMBlElement >> observer [

	^ observer
]

{ #category : 'accessing' }
CMBlElement >> observer: anObserver [

	observer := anObserver
]

{ #category : 'updating' }
CMBlElement >> refresh [

	self subclassResponsibility
]

{ #category : 'initialization' }
CMBlElement >> setUpFor: anObject [

	self subclassResponsibility
]

{ #category : 'updating' }
CMBlElement >> update [
	"Show the current state of what I draw"

	self inSpaceDo: [ self refresh ]
]

{ #category : 'geometry' }
CMBlElement >> verticesOfCell: aCell [
	"Answer the vertices of aCell in pixels, on a grid starting at 0@0"

	| position extent |
	position := self gridPositionOfCell: aCell.
	extent := self cellExtentOf: aCell.
	^ ((self neighbourhoodOf: aCell) blocCellVerticesFor: aCell)
		  collect: [ :each | each * extent + position ]
]

{ #category : 'interaction' }
CMBlElement >> whenAspectsChangedDo: aBlock [
	"Evaluate aBlock instead of updating me after the aspects were changed from my context menu. Whoever gives the block shows the change"

	aspectsChangedBlock := aBlock
]

{ #category : 'interaction' }
CMBlElement >> whenLeftClickOnCellDo: aBlock [
	"Evaluate aBlock with the cell whenever a cell shown under me is clicked with the left button. Only the last block given is kept"

	leftClickBlock ifNil: [
			self
				addEventHandlerOn: BlPrimaryClickEvent
				do: [ :event | self handleLeftClick: event ] ].
	leftClickBlock := aBlock
]

{ #category : 'interaction' }
CMBlElement >> whenRightClickOnEntityDo: aBlock [
	"Evaluate aBlock with the entity whenever a cell or an agent shown under me is clicked with the right button. Only the last block given is kept"

	rightClickBlock ifNil: [
			self
				addEventHandlerOn: BlSecondaryClickEvent
				do: [ :event | self handleRightClick: event ] ].
	rightClickBlock := aBlock
]
