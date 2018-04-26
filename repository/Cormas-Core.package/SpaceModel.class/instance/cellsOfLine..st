ESE (regular) - special locations
cellsOfLine: lineNumber
	"Return the cells in the lineNumber of the spatial grid.
lineNumber   <Integer> lineNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell numLine = lineNumber ]