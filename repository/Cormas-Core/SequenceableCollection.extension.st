Extension { #name : #SequenceableCollection }

{ #category : #'*Cormas-Core' }
SequenceableCollection >> spaceModelDimensionsFor: aCMSpaceModel [ 
	" Private - See #dimensions: in aCMSpaceModel for comments "
	
	aCMSpaceModel
		line: self first 
		column: self second.
]
