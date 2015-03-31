private - regularCells - shapes
eightconnexe
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue:
			[self gridCellShape: #squared.
			self createRectangularCellsFigure].
	self nbNeighbours ~= #eight
		ifTrue:
			[self nbNeighbours: #eight.
			self initNeighbourhood].
	self changed: #shapeHasChanged with: 8	"dispatch the info to all spaceInterfaces"