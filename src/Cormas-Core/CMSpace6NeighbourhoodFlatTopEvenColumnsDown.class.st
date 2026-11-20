"
I am a grid of flat-top hexagons where even columns are shifted down by half a cell. This is the usual flat-top layout of Cormas Pharo.

## Responsibility:

- Find the six neighbours of a cell when even columns are shifted down.
- Place the cells of even columns half a cell lower than the cells of odd columns.
- Measure distances between cells in this layout.

## Collaborators:

- `CMSpaceModel`: chooses me when a grid is created with the neighbourhood `#flat6`.

## Public API and Key Messages

A modeller does not use me directly, but asks for me by my symbol:

```
self
	createGridNumberOfRows: 5
	numberOfColumns: 10
	neighbourhood: #flat6
	closed: true
```

The cell at row 2 and column 2 then touches the cells at rows 2 and 3 of columns 1 and 3.

### Implementation Points

I only say which columns are lowered. Everything else comes from my superclass.
"
Class {
	#name : 'CMSpace6NeighbourhoodFlatTopEvenColumnsDown',
	#superclass : 'CMSpace6NeighbourhoodFlatTop',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMSpace6NeighbourhoodFlatTopEvenColumnsDown class >> cardinalSymbol [

	^ #flat6
]

{ #category : 'geometry' }
CMSpace6NeighbourhoodFlatTopEvenColumnsDown >> boundingRectangleVerticalShiftEven [

	^ 0.5
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTopEvenColumnsDown >> isColumnShiftedDown: aColumnNumber [

	^ aColumnNumber even
]

{ #category : 'converting' }
CMSpace6NeighbourhoodFlatTopEvenColumnsDown >> offsetCoordinatesToAxial: aPoint [
	"Source: https://www.redblobgames.com/grids/hexagons/#conversions-offset, where my layout is called odd-q"

	| row column |
	row := aPoint x - 1.
	column := aPoint y - 1.
	^ column @ (row - (column - (column bitAnd: 1) / 2))
]
