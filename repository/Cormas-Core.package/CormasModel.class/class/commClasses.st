managing classes
commClasses
	
	^ self allEntityClasses select: [ : i | (i inheritsFrom: CMAgentComm) | (i inheritsFrom: CMAgentCommLocation) | (i inheritsFrom: Msg) ]