ESE initialize-release
initializeRegularX: columns Y: lines shape: shapeSymbol nbNeighbours: nbSymbol boundaries: bSymbol
	"Create a grid of regular cells.
lines = number of lines. columns = number of columns.
shapeSymbol =<Symbol> (#squared , )
nbSymbol =<Symbol> (#four, #six or #eight)
bSymbol = <Symbol> (#toroidal or #closed) .
ex, from CormasModel:
	self spaceModel initializeRegularX: 101 Y: 101 shape: #squared nbNeighbours: #eight boundaries: #toroidal."
	
	self resetSpatialEntities.
	self line: lines column: columns shape: shapeSymbol nbNeighbours: nbSymbol
		boundaries: bSymbol.
	self createCells