accessing
isControlActive
	"	^super isControlActive and: [self sensor anyButtonPressed]"
	
	^self sensor anyButtonPressed