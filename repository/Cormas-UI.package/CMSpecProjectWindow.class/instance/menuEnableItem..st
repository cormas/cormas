menu
menuEnableItem: aSelector

	(self selectMenuItemNamed: (self translator perform: aSelector)) enabled: true.
