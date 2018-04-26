ESE initialize-release
setNbNeighbours: anInteger
	"Set the neighbourhood of the regular spaceModel.
	anInteger = <Integer : 4, 6 or 8>"
	
	self nbNeighbours: anInteger.
	(gridCellShape == #squared and: [anInteger = 6]) ifTrue: [self hexagonal].
	(gridCellShape == #hexagonal and: [anInteger ~= 6])
		ifTrue:
			[self gridCellShape: #squared.
			self createRectangularCellsFigure].
	self initNeighbourhood.
	self changed: #shapeHasChanged with: anInteger