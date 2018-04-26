action
addProbe
	
	| aName class |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			aName := Dialog
				request: self chartName
				initialAnswer: ''
				onCancel: [^self].
			(class allInstVarNames includes: aName)
				ifTrue:
					[Cormas current warn: self checkProbeName.
					^self addProbe].
			self modifyProbe: aName asSymbol.
			self listEntitiesChanged]