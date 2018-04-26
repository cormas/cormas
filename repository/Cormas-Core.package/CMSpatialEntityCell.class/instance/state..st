accessing
state: aValue
	
	state = aValue ifTrue: [^nil].
	state := aValue.
	self changed