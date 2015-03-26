managing classes
passiveObjectClasses
	
	^self passiveClasses select: [:i | i inheritsFrom: PassiveObject]