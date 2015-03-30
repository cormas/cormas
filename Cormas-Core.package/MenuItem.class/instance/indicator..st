indication (on/off)
indicator: indicator
	
	indicator isSymbol
		ifTrue: [self indicationSelector: indicator]
		ifFalse: [self indication: indicator]