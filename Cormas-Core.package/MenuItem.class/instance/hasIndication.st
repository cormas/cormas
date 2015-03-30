indication (on/off)
hasIndication
	"Answer if the receiver has some indication (either in the 'on' state or 'off' state)."
	
	adornment == nil
		ifTrue: [^false]
		ifFalse: [^adornment indication ~~ nil]