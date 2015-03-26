init
initRandomly
	"set the neighbour to 8 and initialize the cells randomly"
	
	self spaceModel setNbNeighbours: 8.
	self initCells: #initRandomly