action
modifyPov: povName
	
	selectedClass
		compile:
			(povName asString ,
					'\"return a symbol or a ColorValue"\^#aSymbol\"^ColorValue white"')
				withCRs
		classified: 'pov'
		notifying: nil.
	self editMethod: povName fromClass: selectedClass