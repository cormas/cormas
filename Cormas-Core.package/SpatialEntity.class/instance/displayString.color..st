- obsolete
displayString: aString color: aColor
	
	| x y |
	aString size > 1
		ifTrue: [x := self center x - (self image component width / 2)]
		ifFalse: [x := self center x - (self image component width / 4)].
	y := self center y + (self image component height / 4).
	self view graphicsContext paint: (ColorValue perform: aColor).
	self view graphicsContext
		displayString: aString
		at: x @ y