menu-track
trackAgents: agentClass
	
	| agentFigures menu |
	agentClass withAllSubclasses
		do:
			[:aClass | 
			agentFigures := #().
			(self drawing entityFigures
				at: aClass
				ifAbsent: [nil])
				ifNotNil:
					[agentFigures := (self drawing entityFigures at: aClass) values].
			menu := (self menuHolder value atNameKey: #trackAgents) submenu
				menuItemLabeled: aClass name asString.
			menu isOn
				ifTrue:
					[menu beOff.
					self trackedFigureTypes
						remove: aClass name
						ifAbsent: [nil].
					agentFigures do: [:af | af untrack]]
				ifFalse:
					[menu beOn.
					self trackedFigureTypes add: aClass name.
					agentFigures do: [:af | af track]]]