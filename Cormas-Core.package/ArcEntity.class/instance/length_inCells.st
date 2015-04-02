+ measures
length_inCells
	"returns the distance between startNode and endNode, as a number of cells (also known as Manhattan distance)"
	
	^self startNode patch distanceTo: self stopNode patch