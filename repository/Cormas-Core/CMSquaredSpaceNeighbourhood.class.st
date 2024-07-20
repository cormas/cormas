Class {
	#name : 'CMSquaredSpaceNeighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'environment - sensing - space' }
CMSquaredSpaceNeighbourhood >> nearestEmptyCellFor: aCMAgentLocation [
	
	^ (aCMAgentLocation nearestEmptyNeighborsWithinRadius: (self spaceModel line max: self spaceModel column))
		ifNotEmpty: [ : locations | self selectRandomlyFrom: locations ]
		ifEmpty: [ nil ]
]

{ #category : 'initialization' }
CMSquaredSpaceNeighbourhood >> setBoundaryDirectionsFor: aCMSpatialEntityElement [

	| dirCollection |
	dirCollection := Set new.
	aCMSpatialEntityElement neighbourN ifNil: [ dirCollection add: #N ].
	aCMSpatialEntityElement neighbourW ifNil: [ dirCollection add: #W ].
	aCMSpatialEntityElement neighbourS ifNil: [ dirCollection add: #S ].
	aCMSpatialEntityElement neighbourE ifNil: [ dirCollection add: #E ].
	^ dirCollection
]
