private - regularCells - shapes
fourconnexe
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue:
			[self gridCellShape: #squared.
			self createRectangularCellsFigure].
	self nbNeighbours ~= #four
		ifTrue:
			[self nbNeighbours: #four.
			self initNeighbourhood].
	self changed: #shapeHasChanged with: 4	"dispatch the info to other spaceInterfaces"