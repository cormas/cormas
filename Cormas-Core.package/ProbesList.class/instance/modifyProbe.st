action
modifyProbe
	
	| aClass |
	(self listProbes selection notNil
		and: [self listEntities selection notNil])
		ifTrue:
			[aClass := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			self
				editMethod: self listProbes selection
				fromClass: aClass]