locate manually
stopLocateManually
	
	self reduceNbEntitiesToCreateBy: self numberEntitiesToCreate.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #createNentity #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder namedComponents at: #stopCreateManually) beInvisible.
	(self builder namedComponents at: #stopCreateManually) disable.
	(self builder namedComponents at: #createNentity) beVisible.
	(self linkedSpaceInterface currentTool)
		initialize;
		selected;
		cursor: Cursor normal