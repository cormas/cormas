private - regularCells - shapes
hexagonal
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #hexagonal
		ifTrue:
			[self gridCellShape: #hexagonal.
			self nbNeighbours: #six.
			self createHexagonalCellsFigure.	"the spaceInterfaces are automatically refreshed"
			self initNeighbourhood.
			self changed: #shapeHasChanged]	"set the menu and title to the spaceInterfaces"