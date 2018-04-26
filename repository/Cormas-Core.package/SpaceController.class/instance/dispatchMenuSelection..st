events
dispatchMenuSelection: menuSelection
	"Detournement de la fonction generique initiale, clp Mai 99"
	
	menuSelection = 0 ifTrue: [^self].
	menuSelection isSymbol
		ifTrue:
			[self view mainInterface updatePov: menuSelection	"ifFalse: [self halt]"]