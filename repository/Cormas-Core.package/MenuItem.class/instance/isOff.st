indication (on/off)
isOff
	"Answer if the receiver is in the 'off' state."
	
	adornment == nil
		ifTrue: [^false]
		ifFalse: [^adornment indication == false]