indication (on/off)
indicationSelector
	
	^adornment == nil
		ifTrue: [nil]
		ifFalse: [adornment indicationSelector]