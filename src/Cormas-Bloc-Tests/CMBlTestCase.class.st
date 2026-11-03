"
I am the abstract root of the tests of `Cormas-Bloc`. My subclasses check what is actually drawn by reading pixels.

## Responsibility:

- Build a 3x4 grid of dead cells for a given neighbourhood.
- Draw an element without any window, and answer the color of a pixel.

## Collaborators:

- `CMMockModel`: provides cells and agents with known colors.

## Public API and Key Messages

- `gridWithNeighbourhood:` builds the grid.
- `hexColorIn:at:` answers the color at a point of an element.
- `isTransparentIn:at:` tells whether nothing is drawn at a point of an element.

## Internal Representation

- `model`: the `CMMockModel` under test.
"
Class {
	#name : 'CMBlTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Bloc-Tests',
	#package : 'Cormas-Bloc-Tests'
}

{ #category : 'testing' }
CMBlTestCase class >> isAbstract [

	^ self == CMBlTestCase
]

{ #category : 'private' }
CMBlTestCase >> formOf: anElement [

	anElement forceLayout.
	^ anElement aeAsForm
]

{ #category : 'private' }
CMBlTestCase >> gridWithNeighbourhood: aNeighbourhood [

	model := CMMockModel new.
	model
		createGridNumberOfRows: 3
		numberOfColumns: 4
		neighbourhood: aNeighbourhood
		closed: true.
	model cells do: #initDead
]

{ #category : 'private' }
CMBlTestCase >> hexColorIn: anElement at: aPoint [

	^ ((self formOf: anElement) colorAt: aPoint rounded) asHexString
]

{ #category : 'private' }
CMBlTestCase >> isTransparentIn: anElement at: aPoint [

	^ ((self formOf: anElement) colorAt: aPoint rounded) alpha < 0.01
]

{ #category : 'private' }
CMBlTestCase >> newCowOn: aCell [

	^ (model newEntity: CMMockCow)
		  moveTo: aCell;
		  yourself
]
