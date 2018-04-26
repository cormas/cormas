accessing
pov: aSelector
	
	aSelector = #nil
		ifTrue: [self isOpaque ifTrue: [self transparent]]
		ifFalse: [self isOpaque ifFalse: [self opaque]].
	pov := aSelector