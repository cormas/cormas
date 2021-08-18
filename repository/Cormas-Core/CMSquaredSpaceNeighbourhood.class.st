Class {
	#name : #CMSquaredSpaceNeighbourhood,
	#superclass : #CMSpaceNeighbourhood,
	#category : #'Cormas-Core-Space'
}

{ #category : #testing }
CMSquaredSpaceNeighbourhood class >> isStartConditionFor: aSpaceModel [

	^ aSpaceModel gridCellShape == #squared and: [ self isRegularNeighbourhood: aSpaceModel ]
]
