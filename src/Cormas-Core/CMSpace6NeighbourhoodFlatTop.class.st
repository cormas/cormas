"
I am a grid of flat-top hexagons, each with six neighbours. My subclasses say which columns are shifted down by half a cell, and I do the rest.

## Responsibility:

- Find the six neighbours of a cell, from which columns are shifted down.
- Give the shape and proportions of a flat-top hexagon.
- Leave to my subclasses the choice of shifted columns and the conversion to axial coordinates used for distances.

## Collaborators:

- `CMSpaceModel`: creates one of my subclasses from the neighbourhood symbol given to a grid.
- `CMSpace6NeighbourhoodFlatTopEvenColumnsDown` and `CMSpace6NeighbourhoodFlatTopOddColumnsDown`: my two concrete layouts.

## Public API and Key Messages

I am abstract. A modeller chooses a layout by its symbol:

```
self
	createGridNumberOfRows: 17
	numberOfColumns: 24
	neighbourhood: #flat6OddColumnsDown
	closed: true
```

`#flat6` shifts even columns down, and `#flat6OddColumnsDown` shifts odd columns down, as in Cormas VisualWorks.

### Implementation Points

A diagonal neighbour is found by going one column east or west, and then one row north or south when the column is not shifted the right way. Wrapping across the edges of an open grid comes from `eastCell:`, `westCell:`, `northCell:` and `southCell:`, and is regular only with an even number of columns.
"
Class {
	#name : 'CMSpace6NeighbourhoodFlatTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace6NeighbourhoodFlatTop class >> isStartConditionFor: aSymbolOrNumber [

	^ aSymbolOrNumber == self cardinalSymbol
]

{ #category : 'geometry' }
CMSpace6NeighbourhoodFlatTop >> boundingRectangleHorizontalIntersection [

	^ 0.25
]

{ #category : 'geometry' }
CMSpace6NeighbourhoodFlatTop >> cellProportions [

	^ 1 @ (3 sqrt / 2)
]

{ #category : 'initialization' }
CMSpace6NeighbourhoodFlatTop >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
"Set the neighbourhood of the cell at a given index.
Neighbours are ordered anticlockwise, starting from the North cell"
	| v i |
	v := Array new: 6.
	"prendre la cell au nord"
	(i := self northCell: cellIndex) > 0 ifTrue: [
		v at: 1 put: (aSpaceModel cellAt: i) ].
	"prendre la cell haute à l'est"
	(i := self northEastCellHexaFlat: cellIndex) > 0 ifTrue: [
		v at: 6 put: (aSpaceModel cellAt: i) ].
	"prendre la cell basse à l'est"
	(i := self southEastCellHexaFlat: cellIndex) > 0 ifTrue: [
		v at: 5 put: (aSpaceModel cellAt: i) ].
	"prendre la cell sud"
	(i := self southCell: cellIndex) > 0 ifTrue: [
		v at: 4 put: (aSpaceModel cellAt: i) ].
	"prendre la cell basse à l'ouest"
	(i := self southWestCellHexaFlat: cellIndex) > 0 ifTrue: [
		v at: 3 put: (aSpaceModel cellAt: i) ].
	"prendre la cell haute à l'ouest"
	(i := self northWestCellHexaFlat: cellIndex) > 0 ifTrue: [
		v at: 2 put: (aSpaceModel cellAt: i) ].

	^ (aSpaceModel cellAt: cellIndex) neighbourhoodWithNils: v
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> isColumnShiftedDown: aColumnNumber [
	"Answer whether the cells of this column are half a cell lower than those of the columns beside it"

	^ self subclassResponsibility
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> northEastCellHexaFlat: k [

	k = 0 ifTrue: [ ^ 0 ].
	^ (self isColumnShiftedDown: (self numCol: k))
		  ifTrue: [ self eastCell: k ]
		  ifFalse: [ self northCell: (self eastCell: k) ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> northWestCellHexaFlat: k [

	k = 0 ifTrue: [ ^ 0 ].
	^ (self isColumnShiftedDown: (self numCol: k))
		  ifTrue: [ self westCell: k ]
		  ifFalse: [ self northCell: (self westCell: k) ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> southEastCellHexaFlat: k [

	k = 0 ifTrue: [ ^ 0 ].
	^ (self isColumnShiftedDown: (self numCol: k))
		  ifTrue: [ self southCell: (self eastCell: k) ]
		  ifFalse: [ self eastCell: k ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> southWestCellHexaFlat: k [

	k = 0 ifTrue: [ ^ 0 ].
	^ (self isColumnShiftedDown: (self numCol: k))
		  ifTrue: [ self southCell: (self westCell: k) ]
		  ifFalse: [ self westCell: k ]
]
