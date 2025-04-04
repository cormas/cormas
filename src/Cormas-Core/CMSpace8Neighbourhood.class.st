Class {
	#name : 'CMSpace8Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'initialization' }
CMSpace8Neighbourhood class >> cardinal [

	^ 8
]

{ #category : 'private - accessing' }
CMSpace8Neighbourhood class >> cardinalSymbol [

	^ #eight
]

{ #category : 'accessing' }
CMSpace8Neighbourhood class >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [

	^ nbLines max: nbCols
]

{ #category : 'initialization' }
CMSpace8Neighbourhood >> initializeOrderedNeighbourhood: k [

	| v i |
	v := Array new: 8.
	(i := self northCell: k) > 0 ifTrue: [ 
		v at: 1 put: (self elementaryEntitiesAt: i) ].
	(i := self northCell: (self westCell: k)) > 0 ifTrue: [ 
		v at: 2 put: (self elementaryEntitiesAt: i) ].
	(i := self westCell: k) > 0 ifTrue: [ 
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	(i := self southCell: (self westCell: k)) > 0 ifTrue: [ 
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	(i := self southCell: k) > 0 ifTrue: [ 
		v at: 5 put: (self elementaryEntitiesAt: i) ].
	(i := self southCell: (self eastCell: k)) > 0 ifTrue: [ 
		v at: 6 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCell: k) > 0 ifTrue: [ 
		v at: 7 put: (self elementaryEntitiesAt: i) ].
	(i := self northCell: (self eastCell: k)) > 0 ifTrue: [ 
		v at: 8 put: (self elementaryEntitiesAt: i) ].
	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]
