menus-access
menuBar
	
	| menu siMenuFormat submenu labelsKept |
	siMenuFormat := self siConfig ifNotNil: [:sic | sic siMenuFormat value].
	(siMenuFormat isNil or: [siMenuFormat = #siMenuFull])
		ifTrue: [^self class menuBar]
		ifFalse:
			[menu := self class menuBar.
			labelsKept := OrderedCollection new.
			siMenuFormat ~= #siMenuNone
				ifTrue:
					[labelsKept
						add: 'PoV';
						add: 'Display'].
			(#(#siMenuLimitedWithHabitus #siMenuLimited2WithHabitus) includes:
					siMenuFormat) ifTrue: [labelsKept add: 'Tools'].
			menu labels
				do:
					[:lab | 
					(labelsKept includes: lab)
						ifFalse: [menu hideItem: (menu menuItemLabeled: lab)]
						ifTrue:
							[submenu := (menu menuItemLabeled: lab) submenu.
							(submenu labels includes: 'Habitus')
								ifTrue:
									[submenu labels
										do:
											[:slab | 
											slab ~= 'Habitus'
												ifTrue: [submenu hideItem: (submenu menuItemLabeled: slab)]]].
							(submenu labels includes: 'Spatial delimitor')
								ifTrue:
									[submenu hideItem: (submenu menuItemLabeled: 'Spatial delimitor').
									submenu hideItem: (submenu menuItemLabeled: 'Time').
									submenu hideItem: (submenu menuItemLabeled: 'BackGround').
									(#(#siMenuLimited2 #siMenuLimited2WithHabitus) includes:
											siMenuFormat)
										ifTrue: [submenu hideItem: (submenu menuItemLabeled: 'track')]]]].
			^menu]