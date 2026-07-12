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

{ #category : 'environment - picking - space' }
CMNullCell >> nearestEmptyLocationWithinRadius: r [

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
