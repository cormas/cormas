Class {
	#name : 'CMSpace4Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'private - accessing' }
CMSpace4Neighbourhood class >> cardinal [

	^ 4
]

{ #category : 'private - accessing' }
CMSpace4Neighbourhood class >> cardinalSymbol [

	^ #four
]

{ #category : 'utilities - space metrics' }
CMSpace4Neighbourhood >> distanceInClosedEnvironmentFromPoint: pointA toPoint: pointB [
	
	| xDist yDist |
	
	xDist := (pointA x - pointB x) abs.
	yDist := (pointA y - pointB y) abs.
	
	^ xDist + yDist
]

{ #category : 'initialization' }
CMSpace4Neighbourhood >> initializeOrderedNeighbourhood: k [
"Set the neighbourhood of the cell with id = k.
Neighbours are ordered anticlockwise, starting from the North cell"
	| v i |
	v := Array new: 4.
	(i := self northCell: k) > 0 ifTrue: [ 
		v at: 1 put: (self elementaryEntitiesAt: i) ].
	(i := self westCell: k) > 0 ifTrue: [ 
		v at: 2 put: (self elementaryEntitiesAt: i) ].
	(i := self southCell: k) > 0 ifTrue: [ 
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCell: k) > 0 ifTrue: [ 
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]
