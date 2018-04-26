+ accessing - entities
pickCellConstrainedBy: aBlock
	"Purpose: return a random cell of the grid. The cell verifies the block condition.
Example:  self pickCellConstrainedBy: [:cell | state=#land] or self pickCellConstrainedBy: [: cell | cell energy > 1] "
	
	^Cormas
		selectRandomlyFrom: (self theESE asArray select: [:c | aBlock value: c])