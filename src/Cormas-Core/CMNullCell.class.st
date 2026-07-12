Class {
	#name : 'CMNullCell',
	#superclass : 'CMCell',
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'moving' }
CMNullCell >> leaveWhileMoving: isMoving [
	"Does nothing"
	
	^ self 
]

{ #category : 'accessing' }
CMNullCell >> theOccupantsAt: anIndex [

	^ OrderedCollection new
]
