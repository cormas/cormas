menus
initMenuAttributs
	
	| menuAttributs menuDyn lesAttributs activeClass popGetters menuDyn2 menuPopMetrics |
	lesAttributs := OrderedCollection new.
	listEntities selection = 'Global'
		ifTrue:
			[popGetters := cormasModel allClasses
				collect: [:c | cormasModel getterForEntityClass: c].
			lesAttributs
				addAll:
					(self cormasModel instVarNames
						select: [:var | (popGetters includes: var asSymbol) not])]
		ifFalse:
			[activeClass := self cormasModel environment
				at: listEntities selection asSymbol.
			['CormasKernel*' match: activeClass category asString]
				whileFalse:
					[lesAttributs addAll: activeClass instVarNames.
					activeClass := activeClass superclass]].
	menuDyn := (self menuHolder value atNameKey: #addx) submenu atNameKey:
			#probeOnAttributex.
	menuAttributs := Menu new.
	1
		to: lesAttributs size
		do:
			[:i | 
			| attribut |
			attribut := lesAttributs at: i.
			menuAttributs
				addItemLabel: attribut
				value: [self addAsProbeAttribute: attribut]].
	menuDyn submenu: menuAttributs.
	menuDyn2 := (self menuHolder value atNameKey: #addx) submenu atNameKey:
			#probeOnPopMetrics.
	listEntities selection = 'Global'
		ifTrue:
			["add menu for population metrics"
			(self menuHolder value atNameKey: #addx) submenu unhideItem: menuDyn2.
			menuPopMetrics := MenuBuilder new.
			self cormasModel allClasses
				do:
					[:class | 
					| popAttributs |
					menuPopMetrics beginSubMenuLabeled: class name.
					menuPopMetrics
						addLabel: 'population size'
						value: [self addPopSizeProbeForClass: class].
					popAttributs := OrderedCollection new.
					activeClass := class.
					['CormasKernel*' match: activeClass category asString]
						whileFalse:
							[popAttributs addAll: activeClass instVarNames.
							activeClass := activeClass superclass].
					#(#sum #average #stDev #min #max #median #variance #lowerQuartile #interquartile #upperQuartile)
						do:
							[:metric | 
							menuPopMetrics beginSubMenuLabeled: metric , ' of'.
							popAttributs
								do:
									[:att | 
									menuPopMetrics
										addLabel: att
										value:
											[self
												addPopMetric: metric
												ofAttribute: att asSymbol
												forClass: class]].
							menuPopMetrics endSubMenu].
					menuPopMetrics endSubMenu].
			menuDyn2 submenu: menuPopMetrics menu]
		ifFalse:
			[(self menuHolder value atNameKey: #addx) submenu hideItem: menuDyn2]