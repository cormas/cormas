testing
isDistortable
	
	self container class = VectorialView ifTrue: [^true].
	^isDistortable ifNil: [isDistortable := true]