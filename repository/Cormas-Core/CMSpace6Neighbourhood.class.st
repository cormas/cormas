Class {
	#name : #CMSpace6Neighbourhood,
	#superclass : #CMNonSquaredSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #private }
CMSpace6Neighbourhood class >> implements: aSymborOrNumberNeighbours [
	" Private - See superimplementor's comment "

	^ aSymborOrNumberNeighbours == #six or: [ aSymborOrNumberNeighbours = 6 ]
]

{ #category : #initialization }
CMSpace6Neighbourhood >> initializeOrderedNeighbourhood: k [

	| v i |
	v := Array new: 6.
	(i := self westCellHexa: (self northCell: k)) > 0 ifTrue: [ 
		v at: 1 put: (self elementaryEntitiesAt: i) ].
	(i := self westCell: k) > 0 ifTrue: [ 
		v at: 2 put: (self elementaryEntitiesAt: i) ].
	(i := self westCellHexa: (self southCell: k)) > 0 ifTrue: [ 
		v at: 3 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCellHexa: (self southCell: k)) > 0 ifTrue: [ 
		v at: 4 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCell: k) > 0 ifTrue: [ 
		v at: 5 put: (self elementaryEntitiesAt: i) ].
	(i := self eastCellHexa: (self northCell: k)) > 0 ifTrue: [ 
		v at: 6 put: (self elementaryEntitiesAt: i) ].
	^ (self elementaryEntitiesAt: k) orderedNeighbourhood: v
]
