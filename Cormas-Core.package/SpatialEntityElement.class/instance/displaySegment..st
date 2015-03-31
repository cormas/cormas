- displaying - obsolete
displaySegment: aDirection
	
	| readAccessSelector |
	readAccessSelector := ('lineSegment' , aDirection) asSymbol.
	(self perform: readAccessSelector) notNil
		ifTrue:
			[(self perform: readAccessSelector)
				displayStrokedOn: self view graphicsContext]