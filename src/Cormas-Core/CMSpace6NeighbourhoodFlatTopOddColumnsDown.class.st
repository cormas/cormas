"
I am a grid of flat-top hexagons where odd columns are shifted down by half a cell, as in the grids of Cormas VisualWorks. In `CMSpace6NeighbourhoodFlatTopEvenColumnsDown`, the usual Cormas Pharo layout, even columns are shifted down.

## Responsibility:

- Find the six neighbours of a cell when odd columns are shifted down.
- Place the cells of odd columns half a cell lower than the cells of even columns.
- Measure distances between cells in this layout.

## Collaborators:

- `CMSpaceModel`: chooses me when a grid is created with the neighbourhood `#flat6OddColumnsDown`.

## Public API and Key Messages

A modeller does not use me directly, but asks for me by my symbol:

```
self
	createGridNumberOfRows: 17
	numberOfColumns: 24
	neighbourhood: #flat6OddColumnsDown
	closed: true
```

The cell at row 2 and column 1 then touches the cells at rows 2 and 3 of column 2.

### Implementation Points

I only say which columns are lowered. Everything else comes from my superclass.
"
Class {
	#name : 'CMSpace6NeighbourhoodFlatTopOddColumnsDown',
	#superclass : 'CMSpace6NeighbourhoodFlatTop',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMSpace6NeighbourhoodFlatTopOddColumnsDown class >> cardinalSymbol [

	^ #flat6OddColumnsDown
]

{ #category : 'geometry' }
CMSpace6NeighbourhoodFlatTopOddColumnsDown >> boundingRectangleVerticalShiftOdd [

	^ 0.5
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTopOddColumnsDown >> isColumnShiftedDown: aColumnNumber [

	^ aColumnNumber odd
]

{ #category : 'converting' }
CMSpace6NeighbourhoodFlatTopOddColumnsDown >> offsetCoordinatesToAxial: aPoint [
	"Source: https://www.redblobgames.com/grids/hexagons/#conversions-offset, where my layout is called even-q"

	| row column |
	row := aPoint x - 1.
	column := aPoint y - 1.
	^ column @ (row - (column + (column bitAnd: 1) / 2))
]
