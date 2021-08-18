Class {
	#name : #CMSpace6Neighbourhood,
	#superclass : #CMNonSquaredSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #'private - accessing' }
CMSpace6Neighbourhood class >> cardinal [

	^ 6
]

{ #category : #'private - accessing' }
CMSpace6Neighbourhood class >> cardinalSymbol [

	^ #six
]

{ #category : #'private - regular cells - instance creation' }
CMSpace6Neighbourhood >> eastCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ k ] "ligne impaire ou premiere"
		ifFalse: [ self eastCell: k ] "ligne paire"
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

{ #category : #'private - regular cells - instance creation' }
CMSpace6Neighbourhood >> westCellHexa: k [
	
	k = 0 ifTrue: [ ^ 0 ].
	^ k < self column | ((k - 1) // self column + 1) odd
		ifTrue: [ self westCell: k ] "ligne impaire ou premiere"
		ifFalse: [ k ] "ligne paire"
]
