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
"
Class {
	#name : 'CMBlElement',
	#superclass : 'BlElement',
	#category : 'Cormas-Bloc',
	#package : 'Cormas-Bloc'
}

{ #category : 'accessing' }
CMBlElement class >> cellSize [
	"Answer the size, in pixels, of the longest side of the box around a cell"

	^ 32
]

{ #category : 'instance creation' }
CMBlElement class >> for: anObject [

	^ self new
		  setUpFor: anObject;
		  yourself
]

{ #category : 'drawing' }
CMBlElement >> backgroundOfPov: aPointOfView in: aSpaceModel extent: anExtent [
	"Answer the color or the image with which a point of view fills an element of the given extent"

	aPointOfView isForImage ifFalse: [ ^ aPointOfView color ].

	^ BlBackground image: (self
			   crop:
				   ((self formOfTile: aPointOfView tile in: aSpaceModel)
					    scaledToSize: anExtent max ceiling asPoint)
			   toCenter: anExtent)
]

{ #category : 'geometry' }
CMBlElement >> cellExtentOf: aCell [
	"Answer the extent in pixels of the box around aCell"

	^ (self neighbourhoodOf: aCell) blocCellProportions * self cellSize
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

{ #category : 'updating' }
CMBlElement >> inSpaceDo: aBlock [
	"Elements in a space may only change from the process of that space, while my clients may run in the process of a simulation"

	self isAttachedToSceneGraph
		ifTrue: [ self space defer: aBlock ]
		ifFalse: aBlock
]

{ #category : 'geometry' }
CMBlElement >> neighbourhoodOf: aCell [

	^ aCell spaceModel neighbourhoodConfiguration
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
