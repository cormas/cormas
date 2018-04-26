- obsolete
displayString: aString
	
	| x y |
	x := self components asOrderedCollection first center x.
	y := self components asOrderedCollection first center y.
	self view graphicsContext
		displayString: aString
		at: x @ y