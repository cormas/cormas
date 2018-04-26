gestion controller
performRedButton: unPoint
	
	agents isNil ifTrue: [^self].
	agents
		do:
			[:a | 
			(unPoint - a center) rrr
				<= (a agentSource class image rMax * a agentSource class image size)
				ifTrue:
					[a agentSource inspect.
					^self]]