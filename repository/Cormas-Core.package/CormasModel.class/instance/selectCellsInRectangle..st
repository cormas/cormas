+ accessing - entities
selectCellsInRectangle: aRectangle
	"Purpose: Return a collection of the cells located in a rectangle defined by an origin cell (top left) and a corner cell (down right). The collection of cells is sorted by id.
Argument: aRectangle   <Rectangle> where origin < corner.
Example: self  selectCellsInRectangle: (Rectangle origin: 1@2 corner: 6@3)  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"
	
	^self spaceModel cellsIntoRectangle: aRectangle