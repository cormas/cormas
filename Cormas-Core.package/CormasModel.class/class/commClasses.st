managing classes
commClasses
	
	^self allClasses
		select:
			[:i | 
			(i inheritsFrom: AgentComm) | (i inheritsFrom: AgentCommLocation)
				| (i inheritsFrom: Msg)]