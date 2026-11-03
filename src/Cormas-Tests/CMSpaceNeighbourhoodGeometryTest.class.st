"
I test the grid geometry answered by `CMSpaceNeighbourhood` and its subclasses, using plain numbers and no drawing library.

## Responsibility:

- Check where each kind of grid places the bounding box of a cell.
- Cover overlapping and shifted grids: triangles and both kinds of hexagons.

## Collaborators:

- `CMMockModel`: builds a real grid of cells through the public API.
- `CMSpaceNeighbourhood`: the object under test.

## Public API and Key Messages

- `configurationOfGrid:` builds a 3x4 grid with the given neighbourhood and answers its configuration.
- `cellAt:at:` answers a cell of that grid.

Expected positions are in units of cell size, with `0@0` at the top-left corner of the grid.

```
self assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3)) equals: 2 @ 1
```

## Internal Representation

- `model`: the `CMMockModel` holding the grid.
"
Class {
	#name : 'CMSpaceNeighbourhoodGeometryTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Cormas-Tests-Space',
	#package : 'Cormas-Tests',
	#tag : 'Space'
}

{ #category : 'private' }
CMSpaceNeighbourhoodGeometryTest >> cellAt: aRowNumber at: aColumnNumber [

	^ model cellAt: aRowNumber at: aColumnNumber
]

{ #category : 'private' }
CMSpaceNeighbourhoodGeometryTest >> configurationOfGrid: aNeighbourhood [

	model := CMMockModel new.
	model
		createGridNumberOfRows: 3
		numberOfColumns: 4
		neighbourhood: aNeighbourhood
		closed: true.
	^ model spaceModel neighbourhoodConfiguration
]

{ #category : 'tests' }
CMSpaceNeighbourhoodGeometryTest >> testRelativeOriginOfCellInGridOf4Neighbours [

	| configuration |
	configuration := self configurationOfGrid: 4.

	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 1))
		equals: 0 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3))
		equals: 2 @ 1.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 3 at: 4))
		equals: 3 @ 2
]

{ #category : 'tests' }
CMSpaceNeighbourhoodGeometryTest >> testRelativeOriginOfCellInGridOf8Neighbours [

	| configuration |
	configuration := self configurationOfGrid: 8.

	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 1))
		equals: 0 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3))
		equals: 2 @ 1.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 3 at: 4))
		equals: 3 @ 2
]

{ #category : 'tests' }
CMSpaceNeighbourhoodGeometryTest >> testRelativeOriginOfCellInGridOfFlatTopHexagons [
	"Columns overlap by a quarter of a cell, and even columns are shifted down by half a cell"

	| configuration |
	configuration := self configurationOfGrid: #flat6.

	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 1))
		equals: 0 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 2))
		equals: 0.75 @ 0.5.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3))
		equals: 1.5 @ 1.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 3 at: 4))
		equals: 2.25 @ 2.5
]

{ #category : 'tests' }
CMSpaceNeighbourhoodGeometryTest >> testRelativeOriginOfCellInGridOfPointyTopHexagons [
	"Rows overlap by a quarter of a cell, and even rows are shifted right by half a cell"

	| configuration |
	configuration := self configurationOfGrid: #pointy6.

	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 1))
		equals: 0 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 4))
		equals: 3 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 1))
		equals: 0.5 @ 0.75.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3))
		equals: 2.5 @ 0.75.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 3 at: 4))
		equals: 3 @ 1.5
]

{ #category : 'tests' }
CMSpaceNeighbourhoodGeometryTest >> testRelativeOriginOfCellInGridOfTriangles [
	"Neighbouring triangles overlap by half of their bounding box horizontally"

	| configuration |
	configuration := self configurationOfGrid: 3.

	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 1))
		equals: 0 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 1 at: 2))
		equals: 0.5 @ 0.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 2 at: 3))
		equals: 1 @ 1.
	self
		assert: (configuration relativeOriginOfCell: (self cellAt: 3 at: 4))
		equals: 1.5 @ 2
]
