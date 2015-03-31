+ accessing
numCol
	"Purpose: returns the X coordinate of the cell in a regular spatial grid"
	
	^self id - ((self numLine - 1) * self spaceModel column)