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

{ #category : 'utilities - space metrics' }
CMSpace8Neighbourhood >> distanceInClosedEnvironmentFromPoint: pointA toPoint: pointB [
	
	| xDist yDist |
	
	xDist := (pointA x - pointB x) abs.
	yDist := (pointA y - pointB y) abs.
	
	^ xDist max: yDist
]

{ #category : 'initialization' }
CMSpace8Neighbourhood >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
"Set the neighbourhood of the cell at a given index.
Neighbours are ordered anticlockwise, starting from the North cell"

	| v i |
	v := Array new: 8.
	(i := self northCell: cellIndex) > 0 ifTrue: [ 
		v at: 1 put: (aSpaceModel cellAt: i) ].
	(i := self northCell: (self westCell: cellIndex)) > 0 ifTrue: [ 
		v at: 2 put: (aSpaceModel cellAt: i) ].
	(i := self westCell: cellIndex) > 0 ifTrue: [ 
		v at: 3 put: (aSpaceModel cellAt: i) ].
	(i := self southCell: (self westCell: cellIndex)) > 0 ifTrue: [ 
		v at: 4 put: (aSpaceModel cellAt: i) ].
	(i := self southCell: cellIndex) > 0 ifTrue: [ 
		v at: 5 put: (aSpaceModel cellAt: i) ].
	(i := self southCell: (self eastCell: cellIndex)) > 0 ifTrue: [ 
		v at: 6 put: (aSpaceModel cellAt: i) ].
	(i := self eastCell: cellIndex) > 0 ifTrue: [ 
		v at: 7 put: (aSpaceModel cellAt: i) ].
	(i := self northCell: (self eastCell: cellIndex)) > 0 ifTrue: [ 
		v at: 8 put: (aSpaceModel cellAt: i) ].
	^ (aSpaceModel cellAt: cellIndex) neighbourhoodWithNils: v
]
