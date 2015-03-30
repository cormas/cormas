indication (on/off)
beOff
	"Make the receiver indicate itself as being 'off'."
	
	self isIndicationOfGroup
		ifTrue: [self realAdornment indicationValue: #AsYetUndefined]
		ifFalse: [self indication: false]