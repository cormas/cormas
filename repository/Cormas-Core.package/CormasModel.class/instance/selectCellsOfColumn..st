+ accessing - entities
selectCellsOfColumn: colNumber
	"Purpose: Return a collection of the cells belonging to the specified column of the spatial grid.
Arguments : colNumber   <Integer> colNumber = Positive Integer
Example: self ask: (self selectCellsOfColumn: 2) toDo: #flash"

	^ self spaceModel cellsOfColumn: colNumber