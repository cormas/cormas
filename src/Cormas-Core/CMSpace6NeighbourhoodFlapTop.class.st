"
Hexagonal neighbourhood with Flat top hexagons
"
Class {
	#name : 'CMSpace6NeighbourhoodFlapTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace6NeighbourhoodFlapTop class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 6 "

	^ (super isStartConditionFor: aSymbolOrNumber) ifTrue: [
		  CMSpaceModel flatTopHexagons ]
]

{ #category : 'initialization' }
CMSpace6NeighbourhoodFlapTop >> initializeOrderedNeighbourhood: k [
"Set the neighbourhood of the cell with id = k.
Neighbours are ordered anticlockwise, starting from the North cell"
	| v i |
	v := Array new: 6.
	"prendre la cell au nord"
	(i := self northCell: k) > 0 ifTrue: [
		v at: 1 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell haute à l'est"
	(i := self northEastCellHexaFlat: k) > 0 ifTrue: [
		v at: 6 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell basse à l'est"
	(i := self southEastCellHexaFlat: k) > 0 ifTrue: [
		v at: 5 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell sud"
	(i := self southCell: k) > 0 ifTrue: [
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell basse à l'ouest"
	(i := self southWestCellHexaFlat: k) > 0 ifTrue: [
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	"prendre la cell haute à l'ouest"
	(i := self northWestCellHexaFlat: k) > 0 ifTrue: [
		v at: 2 put: (self elementaryEntitiesAt: i) ].

	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> northEastCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	"if last column"
	numCol = self numberOfColumns ifTrue: [
		self isClosedEnvironment
			ifTrue: [ ^ 0 ]
			ifFalse: [
				numCol odd
					ifFalse: [ ^ self adaptedNumber: k + 1 - self numberOfColumns ]
					ifTrue: [
						^ self northCell:
							  (self adaptedNumber: k + 1 - self numberOfColumns) ] ] ].
	numCol odd
		ifTrue: [ ^ self northCell: (self adaptedNumber: k + 1) ]
		ifFalse: [ ^ self adaptedNumber: k + 1 ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> northWestCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = 1 ifTrue: [
		self isClosedEnvironment
			ifTrue: [ ^ 0 ]
			ifFalse: [ ^ self adaptedNumber: k - 1 ] ].
	numCol even
		ifTrue: [ ^ self adaptedNumber: k - 1 ]
		ifFalse: [ ^ self adaptedNumber: k - 1 - self numberOfColumns ]
]

{ #category : 'set grid' }
CMSpace6NeighbourhoodFlapTop >> organizeShapesPositions: aRSGroup [
	"If r is the radius of the circle passing through all the vertices of the hexagon, then the width of the hexagon is 2r, and the height is 2r cos 30° ( note: cos 30° = (3 sqrt)/2 = 0.866025 ), and one side measures r. Each shape on an even column must be move to a down point [height/2 @ r/2] (r cos 30/-2 @ r/2) "

	| height  r numCol |
	r := (GSegment
		      with: (aRSGroup first points at: 1)
		      with: (aRSGroup first points at: 2)) length.
	height := 3 sqrt * r.
	aRSGroup do: [ :aShape |
		numCol := aShape model columnNumber - 1.
		numCol odd ifTrue: [ 
			aShape translateBy: (numCol * r / -2) @ (height / 2)] 
		ifFalse: [ aShape translateBy: numCol * ((r / -2) @ 0) ]]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> southEastCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = self numberOfColumns ifTrue: [
		self isClosedEnvironment
			ifTrue: [ ^ 0 ]
			ifFalse: [
				numCol odd
					ifFalse: [
						^ self southCell:
							  (self adaptedNumber: k + 1 - self numberOfColumns) ]
					ifTrue: [ ^ self adaptedNumber: k + 1 - self numberOfColumns ] ] ].

	numCol odd
		ifFalse: [ ^ self southCell: (self adaptedNumber: k + 1) ]
		ifTrue: [ ^ self adaptedNumber: k + 1 ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> southWestCellHexaFlat: k [
	"south west"

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := self numCol: k.
	numCol = 1 ifTrue: [
		self isClosedEnvironment
			ifTrue: [ ^ 0 ]
			ifFalse: [ ^ self southCell: (self adaptedNumber: k - 1) ] ].
	numCol even
		ifTrue: [ ^ self southCell: (self adaptedNumber: k - 1) ]
		ifFalse: [ ^ self adaptedNumber: k - 1 ]
]
