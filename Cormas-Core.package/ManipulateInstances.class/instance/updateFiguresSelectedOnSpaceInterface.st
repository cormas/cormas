actions while painting
updateFiguresSelectedOnSpaceInterface
	
	self linkedSpaceInterface drawing clearSelections.
	self linkedSpaceInterface drawing components
		do:
			[:fig | 
			fig model
				ifNotNil:
					[:m | 
					(self selectedEntities includes: m entity)
						ifTrue: [self linkedSpaceInterface drawing toggleSelection: fig]]]