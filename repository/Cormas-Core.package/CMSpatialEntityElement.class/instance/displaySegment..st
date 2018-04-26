- displaying - obsolete
displaySegment: aDirection
	
	| readAccessSelector |
	
	self halt.
	readAccessSelector := ('lineSegment' , aDirection) asSymbol.
	(self perform: readAccessSelector) notNil
		ifTrue:
			[(self perform: readAccessSelector)
				displayStrokedOn: self view graphicsContext]