accessing
spaceModel
	
	^spaceModel ifNil: [spaceModel := ClientSpaceModel new on: self]