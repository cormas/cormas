menu-display options
trackAgents: agentClass
	
	| menu menuSubclass |
	menu := ((builder menuAt: #displayOptionsMenu) value atNameKey:
			#trackAgents) submenu menuItemLabeled: agentClass name asString.
	menu isOn
		ifTrue:
			[menu beOff.
			(self trackedAgents includes: agentClass name)
				ifTrue: [self trackedAgents remove: agentClass name]]
		ifFalse:
			[(self observedEntitiesList list includes: agentClass)
				ifFalse:
					[^Dialog
						warn:
							'The entity ' , agentClass name ,
									' can not be observed in the current configuration'].
			menu beOn.
			(self trackedAgents includes: agentClass name)
				ifFalse: [self trackedAgents add: agentClass name]].
	self forceSItrackAgents: agentClass.
	agentClass subclasses
		do:
			[:aClass | 
			menuSubclass := ((builder menuAt: #displayOptionsMenu) value atNameKey:
					#trackAgents) submenu menuItemLabeled: aClass name asString.
			menu isOn
				ifTrue:
					[menuSubclass beOn.
					(self trackedAgents includes: aClass name)
						ifFalse: [self trackedAgents add: aClass name]]
				ifFalse:
					[menuSubclass beOff.
					(self trackedAgents includes: aClass name)
						ifTrue: [self trackedAgents remove: aClass name]].
			self forceSItrackAgents: aClass]