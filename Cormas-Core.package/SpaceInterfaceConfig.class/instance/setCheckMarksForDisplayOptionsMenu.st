menu-display options
setCheckMarksForDisplayOptionsMenu
	
	| menu menuDyn |
	entitiesList
		do:
			[:agentClass | 
			(agentClass isSituatedClass and: [agentClass inheritsFrom: Agent])
				ifTrue:
					[menu := ((builder menuAt: #displayOptionsMenu) value atNameKey:
							#trackAgents) submenu menuItemLabeled: agentClass name asString.
					(self trackedAgents includes: agentClass name)
						ifFalse: [menu beOff]
						ifTrue: [menu beOn]]].
	isManipulateForTabletEnabled
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleTouchpadMode.
			isManipulateForTabletEnabled
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
		ifNil:
			[self
				isManipulateForTabletEnabled:
					self spaceInterface isManipulateForTabletEnabled].
	isUndoRedoEnabled
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleUndoRedo.
			isUndoRedoEnabled
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]
		ifNil: [self isUndoRedoEnabled: self spaceInterface enableUndo].
	isSingleDefaultPovShown
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultPov.
			isSingleDefaultPovShown
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	isSingleDefaultInfoShown
		ifNotNil:
			[menuDyn := (builder menuAt: #displayOptionsMenu) value atNameKey:
					#toggleShowSingleDefaultInfo.
			isSingleDefaultInfoShown
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]]