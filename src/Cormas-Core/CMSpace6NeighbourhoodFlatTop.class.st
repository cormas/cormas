"
Hexagonal neighbourhood with Flat top hexagons
"
Class {
	#name : 'CMSpace6NeighbourhoodFlatTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMSpace6NeighbourhoodFlatTop class >> cardinalSymbol [

	^ #flat6
]

{ #category : 'testing' }
CMSpace6NeighbourhoodFlatTop class >> isStartConditionFor: aSymbolOrNumber [

	^ aSymbolOrNumber == self cardinalSymbol
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
CMSpace6NeighbourhoodFlatTop >> northEastCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	"if last column"
	numCol = self numberOfColumns ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [ 0 ]
			ifFalse: [
				numCol odd
					ifFalse: [ self adaptedNumber: k + 1 - self numberOfColumns ]
					ifTrue: [
						self northCell:
							(self adaptedNumber: k + 1 - self numberOfColumns) ] ] ].
	^ numCol odd
		ifTrue: [ self northCell: (self adaptedNumber: k + 1) ]
		ifFalse: [ self adaptedNumber: k + 1 ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> northWestCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = 1 ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [ 0 ]
			ifFalse: [ self adaptedNumber: k - 1 ] ].
		
	^ numCol even
		ifTrue: [ self adaptedNumber: k - 1 ]
		ifFalse: [ self adaptedNumber: k - 1 - self numberOfColumns ]
]

{ #category : 'as yet unclassified' }
CMSpace6NeighbourhoodFlatTop >> offsetCoordinatesToAxial: aPoint [
	"Source: https://www.redblobgames.com/grids/hexagons/#conversions-offset"
	| x y parity q r |
	
	"Shift the points by 1 to start indexing at 0 and be consistent with math"
	x := aPoint x - 1.
	y := aPoint y - 1.
	
	parity := y & 1.
	
	q := y.
   r := x - ((y - parity) / 2).

   ^ q @ r
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> southEastCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = self numberOfColumns ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [ 0 ]
			ifFalse: [
				numCol odd
					ifFalse: [
						self southCell:
							(self adaptedNumber: k + 1 - self numberOfColumns) ]
					ifTrue: [ self adaptedNumber: k + 1 - self numberOfColumns ] ] ].

	^ numCol odd
		ifFalse: [ self southCell: (self adaptedNumber: k + 1) ]
		ifTrue: [ self adaptedNumber: k + 1 ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlatTop >> southWestCellHexaFlat: k [
	"south west"

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = 1 ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [ 0 ]
			ifFalse: [ self southCell: (self adaptedNumber: k - 1) ] ].
	^ numCol even
		ifTrue: [ self southCell: (self adaptedNumber: k - 1) ]
		ifFalse: [ self adaptedNumber: k - 1 ]
]
