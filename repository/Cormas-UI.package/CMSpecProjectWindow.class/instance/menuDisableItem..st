menu
menuDisableItem: aSelector

	(self selectMenuItemNamed: (self translator perform: aSelector)) enabled: false.
