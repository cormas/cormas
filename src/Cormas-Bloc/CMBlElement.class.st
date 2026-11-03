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

{ #category : 'geometry' }
CMBlElement >> cellExtentOf: aCell [
	"Answer the extent in pixels of the box around aCell"

	^ (self neighbourhoodOf: aCell) blocCellProportions * self cellSize
]

{ #category : 'geometry' }
CMBlElement >> cellSize [

	^ self class cellSize
]

{ #category : 'geometry' }
CMBlElement >> gridPositionOfCell: aCell [
	"Answer the top-left corner in pixels of the box around aCell, on a grid starting at 0@0"

	^ ((self neighbourhoodOf: aCell) relativeOriginOfCell: aCell)
	  * (self cellExtentOf: aCell)
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
	"Show the current state of what I draw. Elements in a space may only change from the process of that space, while this can be called from the process of a simulation"

	self isAttachedToSceneGraph
		ifTrue: [ self space defer: [ self refresh ] ]
		ifFalse: [ self refresh ]
]
