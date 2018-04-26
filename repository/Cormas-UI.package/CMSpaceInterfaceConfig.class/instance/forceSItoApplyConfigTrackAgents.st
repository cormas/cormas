overwrite spaceInterface
forceSItoApplyConfigTrackAgents
	
	(entitiesList
		sorted: [:a :b | a name asString first > b name asString first])
		do:
			[:agentClass | 
			(agentClass isSituatedClass and: [agentClass inheritsFrom: Agent])
				ifTrue: [self forceSItrackAgents: agentClass]]