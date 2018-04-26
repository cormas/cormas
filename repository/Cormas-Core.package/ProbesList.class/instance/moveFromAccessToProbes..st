action
moveFromAccessToProbes: attributeName
	
	| class source |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			((class allInstVarNames includes: attributeName)
				and: [(class includesSelector: attributeName asSymbol) not])
				ifTrue: [self createAccessors: attributeName].
			source := (class compiledMethodAt: attributeName asSymbol) getSource.
			class removeSelector: attributeName asSymbol.
			class compile: source classified: 'probes' notifying: nil.
			self listEntitiesChanged]