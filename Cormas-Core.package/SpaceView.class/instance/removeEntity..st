adding-removing
removeEntity: aEntityRef
	
	(self findRegisteredFigureFor: aEntityRef) ifNotNil: [:f | self remove: f]