actions
rebuildMenu
	"rebuild the main menu for all opened Cormas (usefull when adding item in the mainMenu)
	Cormas rebuildMenu
	"
	
	self allInstances do: [:each | each rebuildMenu]