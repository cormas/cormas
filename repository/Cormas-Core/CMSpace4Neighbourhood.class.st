Class {
	#name : #CMSpace4Neighbourhood,
	#superclass : #CMSquaredSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #private }
CMSpace4Neighbourhood class >> implements: aSymborOrNumberNeighbours [
	" Private - See superimplementor's comment "

	^ aSymborOrNumberNeighbours == #four or: [ aSymborOrNumberNeighbours = 4 ]
]

{ #category : #initialization }
CMSpace4Neighbourhood >> initializeOrderedNeighbourhood: k [

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
	^ (self elementaryEntitiesAt: k) orderedNeighbourhood: v
]
