Class {
	#name : #CMSquaredSpaceNeighbourhood,
	#superclass : #CMSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #accessing }
CMSquaredSpaceNeighbourhood >> createCellsFigure [

	super createCellsFigure.
	self spaceModel createRectangularCellsFigure.
]

{ #category : #'environment - sensing - space' }
CMSquaredSpaceNeighbourhood >> nearestEmptyCellFor: aCMAgentLocation [
	
	^ (aCMAgentLocation nearestEmptyNeighborsWithinRadius: (self spaceModel line max: self spaceModel column))
		ifNotEmpty: [ : locations |  Cormas selectRandomlyFrom: locations ]
		ifEmpty: [ nil ]
]

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
