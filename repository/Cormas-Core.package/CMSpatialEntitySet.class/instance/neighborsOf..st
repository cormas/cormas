- accessing
neighborsOf: aCollectionOfCells
	"returns a collection of cells that all are neighbors of each element of aCollectionOfCells"
	
	| neighbors |
	neighbors := OrderedCollection new.
	aCollectionOfCells do: [:cell | neighbors addAll: cell neighbourhood].
	^OrderedSet withAll: neighbors - aCollectionOfCells