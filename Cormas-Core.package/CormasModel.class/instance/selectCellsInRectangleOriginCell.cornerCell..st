+ accessing - entities
selectCellsInRectangleOriginCell: cell1 cornerCell: cell2
	"Purpose: Return a collection of the cells located in a rectangle defined by an origin cell and a cell at the opposit corner of the rectangle. The collection of cells is ordered from cell1 to cell2.
Arguments : cell1   <SpatialEntityElement> 
Arguments : cell2   <SpatialEntityElement> 
Example: self createAggregate: City from: (self selectCellsInRectangleOriginCell: self upperLeftCell  cornerCell: self pickCell) "
	
	^self spaceModel cellsIntoRectangleFrom: cell1 to: cell2