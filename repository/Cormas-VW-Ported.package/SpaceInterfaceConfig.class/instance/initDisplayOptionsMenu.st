menu-display options
initDisplayOptionsMenu
	
	| menuDyn agentClasses menuAgents |
	agentClasses := List new.
	agentClasses
		addAll:
			(entitiesList select: [:e | e isSituatedClass and: [e inheritsFrom: Agent]]).
	menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
			#trackAgents.
	menuAgents := Menu new.
	1
		to: agentClasses size
		do:
			[:i | 
			| aClass |
			aClass := agentClasses at: i.
			menuAgents
				addItemLabel: aClass name
				value: [self trackAgents: aClass]].
	menuDyn submenu: menuAgents