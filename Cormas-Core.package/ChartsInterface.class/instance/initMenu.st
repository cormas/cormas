menus
initMenu
	
	| listEntities menuDyn menuEntities |
	cormasModel globalCharts isEmpty
		ifTrue:
			[((self menuHolder value atNameKey: #level) submenu atNameKey: #global)
				disable]
		ifFalse:
			[((self menuHolder value atNameKey: #level) submenu atNameKey: #global)
				enable.
			self setGlobalChartsList].
	listEntities := List new.
	cormasModel allClasses
		do:
			[:cl | 
			(cormasModel localChartsForEntity: cl name) isEmpty
				ifFalse: [listEntities add: cl name]].
	menuDyn := (self menuHolder value atNameKey: #level) submenu atNameKey:
			#local.
	menuEntities := Menu new.
	1
		to: listEntities size
		do:
			[:i | 
			| entity |
			entity := listEntities at: i.
			menuEntities
				addItemLabel: entity asString
				value: [self setLocalChartsListFor: entity]].
	listEntities isEmpty
		ifFalse:
			[menuDyn
				enable;
				submenu: menuEntities.
			cormasModel globalCharts isEmpty
				ifTrue: [self setLocalChartsListFor: listEntities first]]
		ifTrue: [menuDyn disable]