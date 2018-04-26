menus-access
menuModify
	
	| menuFile |
	menuFile := (self menuHolder value atNameKey: #environment) submenu.
	^(menuFile atNameKey: #modify) submenu