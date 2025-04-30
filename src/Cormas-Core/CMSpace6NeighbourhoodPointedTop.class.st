Class {
	#name : 'CMSpace6NeighbourhoodPointedTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace6NeighbourhoodPointedTop class >> example [

	<example>
	^ self new getMasterShape inspect
]

{ #category : 'testing' }
CMSpace6NeighbourhoodPointedTop class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 6 "

	^ (super isStartConditionFor: aSymbolOrNumber) ifTrue: [
		  CMSpaceModel flatTopHexagons not ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointedTop >> eastCellHexa: k [
	"If current cell is on an even line, then returns K+1, otherwise K"

	k = 0 ifTrue: [ ^ 0 ].
	k < self numberOfColumns | (k - 1 // self numberOfColumns + 1) odd
		ifTrue: [ "first or odd line" ^ k ]
		ifFalse: [ "even line" ^ self eastCell: k ]
]

{ #category : 'accessing' }
CMSpace6NeighbourhoodPointedTop >> getMasterShape [

	^ (RSPolygon new points: (RSPolygon generatePointsFitSquare: 6))
		  rotateByDegrees: 90;
		  size: 16;
		  yourself
]

{ #category : 'initialization' }
CMSpace6NeighbourhoodPointedTop >> initializeOrderedNeighbourhood: k [

	| v i | 
	v := Array new: 6.
	(i := self westCellHexa: (self northCell: k)) > 0 ifTrue: [
		v at: 6 put: (self elementaryEntitiesAt: i) ]. "prendre la cell droite au nord"
	(i := self westCell: k) > 0 ifTrue: [
		v at: 5 put: (self elementaryEntitiesAt: i) ]. "prendre la cell droite"
	(i := self westCellHexa: (self southCell: k)) > 0 ifTrue: [
		v at: 4 put: (self elementaryEntitiesAt: i) ]. "prendre la cell droite au sud"
	(i := self eastCellHexa: (self southCell: k)) > 0 ifTrue: [
		v at: 3 put: (self elementaryEntitiesAt: i) ]. "prendre la cell gauche au sud"
	(i := self eastCell: k) > 0 ifTrue: [
		v at: 2 put: (self elementaryEntitiesAt: i) ]. "prendre la cell gauche"
	(i := self eastCellHexa: (self northCell: k)) > 0 ifTrue: [
		v at: 1 put: (self elementaryEntitiesAt: i) ]. "prendre la cell gauche au nord"
	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodPointedTop >> westCellHexa: k [
	"If k is on an odd line, then returns k, otherwise K-1"

	k = 0 ifTrue: [ ^ 0 ].
	k < self numberOfColumns | (k - 1 // self numberOfColumns + 1) odd
		ifTrue: [ "ligne impaire ou premiere" ^ self westCell: k ]
		ifFalse: [ "ligne paire" ^ k ]
]
