ESE (regular) - special locations
cellsOfColumn: colNumber
	"Return the cells in the colNumber of the spatial grid.
colNumber   <Integer> colNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell numCol = colNumber ]