main menu
rebuildMenu
	"rebuild the main menu (usefull when adding item in the mainMenu)"
	
	self menuHolder value: self class mainMenu.
	self isChangesDelayed: self isChangesDelayed.
	self mainWin ifNotNil: [:win | win checkForEvents]