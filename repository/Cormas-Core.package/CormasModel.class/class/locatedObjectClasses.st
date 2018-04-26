managing classes
locatedObjectClasses
	
	^self passiveClasses select: [:i | i inheritsFrom: CMObjectLocation]