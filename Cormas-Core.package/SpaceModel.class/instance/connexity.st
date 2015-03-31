private - accessing
connexity
	"Purpose: returns the value of the grid connexity, i.e. 8, 4 or 6.
If the grid is irregular, returns 0"
	
	self gridCellShape = #irregular ifTrue: [^0].
	self nbNeighbours = #eight ifTrue: [^8].
	self nbNeighbours = #four ifTrue: [^4].
	self nbNeighbours = #six ifTrue: [^6]