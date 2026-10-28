Class {
	#name : 'CMNullCell',
	#superclass : 'CMCell',
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'testing' }
CMNullCell >> isSituated [ 

	^ false
]

{ #category : 'moving' }
CMNullCell >> leaveWhileMoving: isMoving [
	"Does nothing"
	
	^ self 
]

{ #category : 'accessing' }
CMNullCell >> nearestCellVerifying: aCondition [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestCellWithoutAny: aClass [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestCellsVerifying: aCondition [

	^ #()
]

{ #category : 'environment - picking - space' }
CMNullCell >> nearestEmptyLocationWithinRadius: r [

	^ #()
]

{ #category : 'environment - sensing - agents' }
CMNullCell >> nearestLocatedEntities: locatedEntityName withinRadius: range [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestNeighborVerifying: aBlock withinRadius: range [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestNeighborWithoutAny: locatedEntityName withinRadius: r [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestNeighborsVerifying: aBlock withinRadius: range [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> nearestNeighborsWithoutAny: aClass withinRadius: range [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> neighbourhood [

	^ #()
]

{ #category : 'environment - sensing - space' }
CMNullCell >> neighbourhoodOfRadius: range verifying: aBlock [

	^ #()
]

{ #category : 'environment - sensing - agents' }
CMNullCell >> occupantsOfClassNamed: aName [

	^ #()
]

{ #category : 'accessing' }
CMNullCell >> theOccupantsAt: anIndex [

	^ OrderedCollection new
]
