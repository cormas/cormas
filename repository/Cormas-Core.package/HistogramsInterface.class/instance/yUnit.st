accessing
yUnit
	
	^yUnit isNil
		ifTrue: [yUnit := #yunitOccurence asValue]
		ifFalse: [yUnit]