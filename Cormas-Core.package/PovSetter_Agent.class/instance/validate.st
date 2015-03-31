action
validate
	
	| selectedSymbol aPOV |
	listSymbols selection
		ifNil: [^Dialog warn: 'Please, select a pov symbol']
		ifNotNil: [:aSelec | selectedSymbol := aSelec asSymbol].
	aPOV := imageOS model.	"copy"
	(aPOV isKindOf: BitmapPOV)
		ifFalse:
			[aPOV scaledBy: imageOS model sizeRatio.
			aPOV sizeRatio: nil.
			aPOV isDistortable: self isDistortable value]
		ifTrue: [aPOV bitmap: imageOS figure bitmap copy].
	selectedClass povDict at: selectedSymbol put: aPOV.	"on met √† jour le dico povDict"
	self savePOVsymbol: selectedSymbol.	"on sauvegarde au niveau de la classe de l''entit√©"	""	"on demande aux agents de rafraichir leur afficage pour ce povResult"
	self cormas currentSimulation
		ifNotNil:
			[:sim | 
			(sim allTheEntities: selectedClass)
				do:
					[:entity | 
					sim
						registerEntityChange: #povSymbolChanged
						with: selectedSymbol
						from: (EntityReference on: entity)]].	"ne fonctionne pas lorsque le povResult est un povId ou un povEnergy ; c''est √† dire un pov dont la couleur est calcul√©, car ds ce cas le povResult est une couleur au 	niveau de la figure alors que c''est le povName sumbol (povId) pour l''entityPov"
	self tailleSlider value: 1