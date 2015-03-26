locate manually
startLocateManually
	
	(self entityClass isNil not and: [self isNbEntitiesToCreatePositive])
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(#(#entityChoices #createNentity #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained)
						refersToLiteral: k) ifTrue: [v disable]].
			(self builder namedComponents at: #createNentity) beInvisible.
			(self builder namedComponents at: #stopCreateManually) beVisible.
			(self builder namedComponents at: #stopCreateManually) enable].
	self initialTool: self linkedSpaceInterface currentTool.	"self linkedSpaceInterface disableAllTools."
	self linkedSpaceInterface activateCreateEntityTool