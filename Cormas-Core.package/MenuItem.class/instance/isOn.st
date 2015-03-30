indication (on/off)
isOn
	"Answer if the receiver is in the 'on' state."
	
	^adornment == nil
		ifTrue: [false]
		ifFalse:
			[| indicationValue |
			indicationValue := adornment indication value.
			indicationValue == true
				or: [nameKey notNil and: [nameKey = indicationValue]]]