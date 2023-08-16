Class {
	#name : #CMSpace8Neighbourhood,
	#superclass : #CMSquaredSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #initialization }
CMSpace8Neighbourhood class >> cardinal [

	^ 8
]

{ #category : #'private - accessing' }
CMSpace8Neighbourhood class >> cardinalSymbol [

	^ #eight
]

{ #category : #accessing }
CMSpace8Neighbourhood class >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [

	^ nbLines max: nbCols
]

{ #category : #initialization }
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
	^ (self elementaryEntitiesAt: k) neighbourhood: v
]

{ #category : #initialization }
CMSpace8Neighbourhood >> setBoundaryDirectionsFor: aCMSpatialEntityElement [

	| dirCollection |
	dirCollection := super setBoundaryDirectionsFor: aCMSpatialEntityElement.
	aCMSpatialEntityElement neighbourNE ifNil: [ dirCollection add: #NE ].
	aCMSpatialEntityElement neighbourSE ifNil: [ dirCollection add: #SE ].
	aCMSpatialEntityElement neighbourNW ifNil: [ dirCollection add: #NW ].
	aCMSpatialEntityElement neighbourSW ifNil: [ dirCollection add: #SW ].
	^ dirCollection
]
