control
connexity
	"Purpose: returns the value of the grid connexity, i.e. 8, 4 or 6.
If the grid is irregular, returns the number of neighbors of the current cell"
	
	self spaceModel gridCellShape = #irregular
		ifTrue: [^self neighbourhood size].
	^self spaceModel connexity