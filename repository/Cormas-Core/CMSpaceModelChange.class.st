"
SpaceModelChange represents a delayed change from the spaceModel.
"
Class {
	#name : 'CMSpaceModelChange',
	#superclass : 'CMGenericChange',
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'printing' }
CMSpaceModelChange >> printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll:
			('(<1p>, <2p>)'
				expandMacrosWith: self symbol
				with: self parameter)
]
