indication (on/off)
beOn
	"Make the receiver indicate itself as being 'on'."
	
	self isIndicationOfGroup
		ifTrue: [self realAdornment indicationValue: nameKey]
		ifFalse: [self indication: true]