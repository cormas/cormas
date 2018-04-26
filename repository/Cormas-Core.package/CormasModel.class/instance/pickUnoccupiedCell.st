+ accessing - entities
pickUnoccupiedCell
	"Purpose: return a random cell not occuppied of the grid
Return Value: a cell"
	
	^self pickCellConstrainedBy: [:cell | cell noOccupant]