actions
modifyPov: povName
	
	selectedClass
		compile:
			(povName asString ,
					'\"return a symbol that is associated to an image"\   ^#aSymbol\')
				withCRs
		classified: 'pov'
		notifying: nil.
	self editMethod: povName fromClass: selectedClass