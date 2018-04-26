+ accessing - entities
selectCellsOfLine: lineNumber
	"Purpose: Return a collection of the cells belonging to the specified line of the spatial grid.
Arguments : lineNumber   <Integer> lineNumber = Positive Integer
Example: self ask: (self selectCellsOfLine: 2) toDo: #flash"

	^ self spaceModel cellsOfLine: lineNumber