ESE (regular) - special locations
cellsIntoRectangle: aRectangle
	"Return the cells between the lineNumber and the colNumber of the spatial grid. The Cells are sorted by id.
aRectangle   <Rectangle> where origin < corner.
Ex:  cellsIntoRectangle: (Rectangle origin: 1@2 corner: 6@3)  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"
	
	| cellsCol |
	cellsCol := self
		cellsBetweenColumn1: aRectangle origin y
		andColumn2: aRectangle corner y.
	^(self
		cellsBetweenLine1: aRectangle origin x
		andLine2: aRectangle corner x) select: [:c | cellsCol includes: c]