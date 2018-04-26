model entities
basicAgentClasses
	
	| coll |
	coll := OrderedCollection 
		with: CMAgentComm 
		with: CMAgentLocation
		with: CMAgentCommLocation.
	coll
		addAll: (OrderedCollection 
			with: Group 
			with: CMGroupComm 
			with: CMGroupLocation 
			with: 	CMGroupCommLocation).
	^ coll