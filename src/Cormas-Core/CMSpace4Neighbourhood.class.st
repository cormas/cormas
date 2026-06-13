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
CMSpace4Neighbourhood >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
"Set the neighbourhood of the cell at a given index.
Neighbours are ordered anticlockwise, starting from the North cell"
	| v i |
	v := Array new: 4.
	(i := self northCell: cellIndex) > 0 ifTrue: [ 
		v at: 1 put: (aSpaceModel cellAt: i) ].
	(i := self westCell: cellIndex) > 0 ifTrue: [ 
		v at: 2 put: (aSpaceModel cellAt: i) ].
	(i := self southCell: cellIndex) > 0 ifTrue: [ 
		v at: 3 put: (aSpaceModel cellAt: i) ].
	(i := self eastCell: cellIndex) > 0 ifTrue: [ 
		v at: 4 put: (aSpaceModel cellAt: i) ].
	^ (aSpaceModel cellAt: cellIndex) neighbourhoodWithNils: v
]
