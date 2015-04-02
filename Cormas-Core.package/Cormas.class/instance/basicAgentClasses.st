model entities
basicAgentClasses
	
	| coll |
	coll := OrderedCollection with: Agent with: AgentComm with: AgentLocation
		with: AgentCommLocation.
	coll
		addAll:
			(OrderedCollection with: Group with: GroupComm with: GroupLocation with:
					GroupCommLocation).
	^coll