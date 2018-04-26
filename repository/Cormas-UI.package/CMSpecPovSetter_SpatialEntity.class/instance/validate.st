action
validate
	
	| selectedSymbol |
	listSymbols selection
		ifNil:
			[^Dialog
				warn:
					(UserMessage defaultString: 'Select a pov symbol' key: #selectPovMethod)
						asString]
		ifNotNil: [:aSelec | selectedSymbol := aSelec asSymbol].
	selectedClass colorsDict at: selectedSymbol put: couleur.	"on met √† jour le dico 'colorsDict' de la classe de l'entite"
	self savePOVsymbol: selectedSymbol.	"on sauvegarde au niveau de la casse de l''entit√©"	""	"ask the currently dispayed figures that correspond this povResult to update color"
	self cormas currentSimulation
		ifNotNil:
			[:sim | 
			(sim allTheEntities: selectedClass)
				do:
					[:entity | 
					sim
						registerEntityChange: #povSymbolChanged
						with: selectedSymbol
						from: (EntityReference on: entity)]].
	(self builder componentAt: #boutonAppliquer) disable