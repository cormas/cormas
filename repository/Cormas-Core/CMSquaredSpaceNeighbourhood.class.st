Class {
	#name : #CMSquaredSpaceNeighbourhood,
	#superclass : #CMSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #initialization }
CMSquaredSpaceNeighbourhood >> setBoundaryDirectionsFor: aCMSpatialEntityElement [

	| dirCollection |
	dirCollection := Set new.
	aCMSpatialEntityElement neighbourN ifNil: [ dirCollection add: #N ].
	aCMSpatialEntityElement neighbourW ifNil: [ dirCollection add: #W ].
	aCMSpatialEntityElement neighbourS ifNil: [ dirCollection add: #S ].
	aCMSpatialEntityElement neighbourE ifNil: [ dirCollection add: #E ].
	^ dirCollection
]
