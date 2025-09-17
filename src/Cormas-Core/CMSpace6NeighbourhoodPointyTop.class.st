"
Hexagonal neighbourhood with Pointy top hexagons
"
Class {
	#name : 'CMSpace6NeighbourhoodPointyTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'accessing' }
CMSpace6NeighbourhoodPointyTop class >> cardinal [

	^ 6
]

{ #category : 'accessing' }
CMSpace6NeighbourhoodPointyTop class >> cardinalSymbol [

	^ #pointy6
]

{ #category : 'initialization' }
CMSpace6NeighbourhoodPointyTop >> initializeOrderedNeighbourhood: k [
"Set the neighbourhood of the cell with id = k.
Neighbours are ordered anticlockwise, starting from the North-East cell"

	| v i |
	v := Array new: 6.
	"Cell at north east"
	(i := self northEastCellHexa: k) > 0 ifTrue: [
		v at: 6 put: (self elementaryEntitiesAt: i) ].
	"Cell at East"
	(i := self eastCell: k) > 0 ifTrue: [
		v at: 5 put: (self elementaryEntitiesAt: i) ].
	"Cell at south east"
	(i := self southEastCellHexa: k) > 0 ifTrue: [
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell sud"
	(i := self southWestCellHexa: k) > 0 ifTrue: [
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell à l'ouest"
	(i := self westCell: k) > 0 ifTrue: [
		v at: 2 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell haute à l'ouest"
	(i := self northWestCellHexa: k) > 0 ifTrue: [
		v at: 1 put: (self elementaryEntitiesAt: i) ].

	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointyTop >> northEastCellHexa: k [
	"Return the ID of the North-East cell."
	| numRow |
	k = 0 ifTrue: [ ^ 0 ].
	numRow := self numRow: k.
	"If 1st line"
	numRow = 1 ifTrue: [
		self isClosedEnvironment ifTrue: [ ^ 0 ] ].

	(self numCol: k) = self numberOfColumns ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [
				numRow even
					ifTrue: [ 0 ]
					ifFalse: [ self northCell: k ] ]
			ifFalse: [
				numRow even
					ifFalse: [ self adaptedNumber: k - self numberOfColumns ]
					ifTrue: [
						self northCell:
							(self adaptedNumber: k + 1 - self numberOfColumns) ] ] ].
	^ numRow odd
		ifTrue: [ self northCell: k ]
		ifFalse: [ self northCell: (self adaptedNumber: k + 1) ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointyTop >> northWestCellHexa: k [
	"Return the ID of the North-West cell."

	| numRow |
	k = 0 ifTrue: [ ^ 0 ].
	numRow := self numRow: k.
	(self numCol: k) = 1 ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [
				numRow odd
					ifTrue: [ 0 ]
					ifFalse: [ self northCell: k ] ]
			ifFalse: [
				numRow even
					ifTrue: [ self adaptedNumber: k - self numberOfColumns ]
					ifFalse: [ self adaptedNumber: k - 1 ] ] ].
	numRow = 1 ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [ 0 ]
			ifFalse: [
				numRow even
					ifTrue: [ self adaptedNumber: k - 1 ]
					ifFalse: [ self adaptedNumber: k - 1 - self numberOfColumns ] ] ].

	^ numRow even
		ifTrue: [ self adaptedNumber: k - self numberOfColumns ]
		ifFalse: [ self adaptedNumber: k - 1 - self numberOfColumns ]
]

{ #category : 'as yet unclassified' }
CMSpace6NeighbourhoodPointyTop >> offsetCoordinatesToAxial: aPoint [
	"Source: https://www.redblobgames.com/grids/hexagons/#conversions-offset"
	| x y parity q r |
	
	"Shift the points by 1 to start indexing at 0 and be consistent with math"
	x := aPoint x - 1.
	y := aPoint y - 1.
	
	parity := x & 1.
	
	q := y - ((x - parity) / 2).
   r := x.

   ^ q @ r
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointyTop >> southEastCellHexa: k [
	"Return the ID of the South-East cell."

	| numRow |
	k = 0 ifTrue: [ ^ 0 ].
	numRow := self numRow: k.
	(self numCol: k) = self numberOfColumns ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [
				numRow even
					ifTrue: [ 0 ]
					ifFalse: [ self southCell: k ] ]
			ifFalse: [
				numRow odd
					ifTrue: [ self southCell: k ]
					ifFalse: [ self adaptedNumber: k + 1 ] ]].

	^ numRow odd
		ifTrue: [ self southCell: k ]
		ifFalse: [ self southCell: (self adaptedNumber: k + 1) ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointyTop >> southWestCellHexa: k [
	"Return the ID of the South-West cell (= southCell: k-1)"

	| numRow |
	k = 0 ifTrue: [ ^ 0 ].
	numRow := self numRow: k.
	(self numCol: k) = 1 ifTrue: [
		^ self isClosedEnvironment
			ifTrue: [
				numRow odd
					ifTrue: [ 0 ]
					ifFalse: [ self southCell: k ] ]
			ifFalse: [ 
				numRow odd
					ifTrue: [ self southCell: (self adaptedNumber: (k + self numberOfColumns - 1)) ]
					ifFalse: [ self southCell: k ] ] ].
			
	^ numRow odd
		ifTrue: [ self southCell: k - 1 ]
		ifFalse: [ self southCell: k ]
]
