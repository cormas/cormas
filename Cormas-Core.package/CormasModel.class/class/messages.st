managing classes
messages
	
	^self passiveClasses select: [:i | i inheritsFrom: Msg]