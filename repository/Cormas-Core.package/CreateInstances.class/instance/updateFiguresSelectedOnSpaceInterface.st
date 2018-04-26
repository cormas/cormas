interact with spaceInterface
updateFiguresSelectedOnSpaceInterface
	
	self linkedSpaceInterface drawing clearSelections.
	self linkedSpaceInterface drawing components
		do:
			[:fig | 
			(self selectedEntities includes: fig model entity)
				ifTrue: [self linkedSpaceInterface drawing toggleSelection: fig]]