manipulate instances
updateEntitiesSelectionWith: collecOfFigures lastFigureSelected: aFigure
	
	self manipInstancesController ifNil: [^nil].
	self manipInstancesController
		updateInstancesSelectionWith:
			(collecOfFigures collect: [:f | f model entity])
		lastSelected: aFigure model entity