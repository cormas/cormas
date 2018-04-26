private - regular cells - instance creation
createCellsPovWithReferences: entitiesRef
	"creation de l'ensemble des cellules et leurs connections"
	
	self gridCellShape = #squared
		ifTrue: [self createRectangularCellsPovWithReferences: entitiesRef].
	self gridCellShape = #hexagonal
		ifTrue: [self createHexagonalCellsPovWithReferences: entitiesRef]