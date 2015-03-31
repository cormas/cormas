adding-removing
removeOccupant: aSituatedEntityReference
	
	(self findRegisteredFigureFor: aSituatedEntityReference)
		ifNotNil: [:f | self remove: f]