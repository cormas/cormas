Extension { #name : 'Association' }

{ #category : '*Cormas-Core' }
Association >> spaceModelDimensionsFor: aCMSpaceModel [ 
	" Private - See #dimensions: in aCMSpaceModel for comments "
		
	aCMSpaceModel
		line: self key 
		column: self value.
]
