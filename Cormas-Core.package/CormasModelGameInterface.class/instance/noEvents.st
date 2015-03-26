menu
noEvents
	
	| updatedMenu |
	updatedMenu := ((self builder menuAt: #menuDecisionsSheet) atNameKey:
			#DecisionsSheet) submenu.
	updatedMenu removeItem: (updatedMenu atNameKey: #Events)