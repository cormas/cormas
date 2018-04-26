menu
buildMenuDecisionsSheet
	
	| updatedMenu |
	updatedMenu := ((self builder menuAt: #menuDecisionsSheet) atNameKey:
			#DecisionsSheet) submenu.
	self model playersNames
		do:
			[:pn | 
			updatedMenu
				addItem: (MenuItem labeled: pn asString)
				value: [self resetDecisionsSheet: pn]
				nameKey: pn asSymbol]