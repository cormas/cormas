"
SpaceModelChange represents a delayed change from the spaceModel.
"
Class {
	#name : #SpaceModelChange,
	#superclass : #GenericChange,
	#category : 'Cormas-Core-Space'
}

{ #category : #dispatching }
SpaceModelChange >> dispatchOn: anObject [
	
	anObject noticeSpaceModelChange: self
]

{ #category : #printing }
SpaceModelChange >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll:
			('(<1p>, <2p>)'
				expandMacrosWith: self symbol
				with: self parameter)
]
