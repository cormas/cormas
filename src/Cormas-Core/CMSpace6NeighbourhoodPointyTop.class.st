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

{ #category : 'testing' }
CMSpace6NeighbourhoodPointyTop class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 6 "

	^ (super isStartConditionFor: aSymbolOrNumber) ifTrue: [
		  CMSpaceModel flatTopHexagons not ]
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

{ #category : 'set grid' }
CMSpace6NeighbourhoodPointyTop >> organizeShapesPositions: aRSGroup [
	| point1 point2 outerRadius innerRadius numLine offset |
	
	point1 := aRSGroup first points first.
	point2 := aRSGroup first points second.
	
	"Radius of a circumcircle - a circle passing through all vertices of a hexagon"
	outerRadius := point1 distanceTo: point2.
	
	"Radius of an incircle - a circle passing through the middle of each side of a hexagon"
	innerRadius := 3 sqrt / 2 * outerRadius.
	
	aRSGroup do: [ :aShape |
		numLine := aShape model rowNumber - 1.
		
		offset := numLine odd
			ifTrue: [ innerRadius @ (numLine * outerRadius / -2) ]
			ifFalse: [ 0 @ (numLine * outerRadius / -2) ].
			
		aShape translateBy: offset ]
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
