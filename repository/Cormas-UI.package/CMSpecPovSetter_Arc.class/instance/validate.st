action
validate
	
	| selectedSymbol aPOV |
	listSymbols selection
		ifNil:
			[^Dialog
				warn:
					(UserMessage defaultString: 'Select a pov symbol' key: #selectPovMethod)
						asString]
		ifNotNil: [:aSelec | selectedSymbol := aSelec asSymbol].
	aPOV := imageOS model copy.
	selectedClass povDict at: selectedSymbol put: aPOV.	"on met √† jour le dico povDict"
	self savePOVsymbol: selectedSymbol.	"on sauvegarde au niveau de la classe de l''entit√©"	""	"on fait oublier aux agents leur visualState pour ce pov"
	self cormas currentSimulation
		ifNotNil:
			[:sim | 
			(sim allTheEntities: selectedClass)
				do:
					[:entity | 
					sim
						registerEntityChange: #povSymbolChanged
						with: selectedSymbol
						from: (EntityReference on: entity)]	"entity replacePovAtSymbol: selectedSymbol]"]