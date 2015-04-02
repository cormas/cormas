mainMenu (resources)
mainMenu
	"the main menu depends on the runtime mode"
	
	^self isModelUserMode
		ifTrue: [self modelUserMainMenu]
		ifFalse: [self fullMainMenu]