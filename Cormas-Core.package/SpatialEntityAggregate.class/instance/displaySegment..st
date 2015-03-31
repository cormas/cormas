- obsolete
displaySegment: aDirection
	
	| readAccessSelector aGC |
	aGC := self graphicsContext.
	aGC paint: #black.
	readAccessSelector := ('lineSegment' , aDirection) asSymbol.
	(self perform: readAccessSelector) notNil
		ifTrue: [(self perform: readAccessSelector) displayStrokedOn: aGC]