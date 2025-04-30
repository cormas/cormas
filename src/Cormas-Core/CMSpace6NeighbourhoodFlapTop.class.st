Class {
	#name : 'CMSpace6NeighbourhoodFlapTop',
	#superclass : 'CMSpace6Neighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace6NeighbourhoodFlapTop class >> example [

	<example>
	^ self new getMasterShape inspect
]

{ #category : 'testing' }
CMSpace6NeighbourhoodFlapTop class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 6 "

	^ (super isStartConditionFor: aSymbolOrNumber) ifTrue: [
		  CMSpaceModel flatTopHexagons ]
]

{ #category : 'accessing' }
CMSpace6NeighbourhoodFlapTop >> getMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generatePointsFitSquare: 6);
		  size: 16;
		  yourself
]

{ #category : 'initialization' }
CMSpace6NeighbourhoodFlapTop >> initializeOrderedNeighbourhood: k [

	| v i | 
	v := Array new: 6.
	(i := self northCell: k) > 0 ifTrue: [
		v at: 6 put: (self elementaryEntitiesAt: i) ]. "prendre la cell au nord"
	(i := self northCellHexaFlat: (self eastCell: k)) > 0 ifTrue: [
		v at: 5 put: (self elementaryEntitiesAt: i) ]. "prendre la cell haute à l'est"
	(i := self southCellHexaFlat: (self eastCell: k)) > 0 ifTrue: [
		v at: 4 put: (self elementaryEntitiesAt: i) ]. "prendre la cell basse à l'est"
	(i := self southCell: k) > 0 ifTrue: [
		v at: 3 put: (self elementaryEntitiesAt: i) ]. "prendre la cell sud"
	(i := self southCellHexaFlat: (self westCell: k)) > 0 ifTrue: [
		v at: 2 put: (self elementaryEntitiesAt: i) ]. "prendre la cell basse à l'ouest"
	(i := self northCellHexaFlat: (self westCell: k)) > 0 ifTrue: [
		v at: 1 put: (self elementaryEntitiesAt: i) ]. "prendre la cell haute à l'ouest"

	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> northCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := k - ((k / self numberOfColumns) ceiling - 1 * self numberOfColumns).
	numCol odd
		ifTrue: [ "colonne impaire ou premiere" ^ self northCell: k ]
		ifFalse: [ "colonne paire" ^ k ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpace6NeighbourhoodFlapTop >> southCellHexaFlat: k [

	| numCol |
	k = 0 ifTrue: [ ^ 0 ].
	numCol := k - ((k / self numberOfColumns) ceiling - 1 * self numberOfColumns).
	numCol odd
		ifFalse: [ "colonne impaire ou premiere" ^ self southCell: k ]
		ifTrue: [ "colonne paire" ^ k ]
]
