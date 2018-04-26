overwrite spaceInterface
forceSItrackAgents: aClass
	
	| menuSI agentFigures |
	menuSI := (self spaceInterface menuHolder value atNameKey: #trackAgents)
		submenu
		menuItemLabeled: aClass name asString
		ifNone: [nil].
	(((self trackedAgents includes: aClass name) and: [menuSI isOn not])
		or:
			[(self trackedAgents includes: aClass name) not
				and: [menuSI isNil not and: [menuSI isOn]]])
		ifTrue:
			[agentFigures := #().
			(self spaceInterface drawing entityFigures
				at: aClass
				ifAbsent: [nil])
				ifNotNil:
					[agentFigures := (self spaceInterface drawing entityFigures at: aClass)
						values].
			menuSI isOn
				ifTrue:
					[menuSI beOff.
					self spaceInterface trackedFigureTypes
						remove: aClass name
						ifAbsent: [nil].
					agentFigures do: [:af | af untrack]]
				ifFalse:
					[menuSI beOn.
					(self spaceInterface trackedFigureTypes includes: aClass name)
						ifFalse: [self spaceInterface trackedFigureTypes add: aClass name].
					agentFigures do: [:af | af track]]]