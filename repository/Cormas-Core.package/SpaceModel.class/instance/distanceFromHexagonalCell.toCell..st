landscape indices
distanceFromHexagonalCell: cell1 toCell: cell2
	"return the distance in number of hexagonal cells"
	
	| nbLines nbCols add colTheoriq |
	self nbNeighbours = #six ifFalse: [self halt].
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self boundaries = #torroidal
		ifTrue:
			[nbLines := nbLines min: self line - nbLines.
			nbCols := nbCols min: self column - nbCols.
			nbLines odd ifTrue: [nbCols := nbCols + 1]].
	add := 0.
	colTheoriq := nbLines even
		ifTrue: [nbLines / 2]
		ifFalse: [(nbLines + 1) / 2].
	colTheoriq < nbCols ifTrue: [add := nbCols - colTheoriq].
	^nbLines + add