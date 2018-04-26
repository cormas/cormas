landscape indices
euclideanDistanceFromCell: cell1 toCell: cell2
	"return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"
	
	| nbLines nbCols |
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self boundaries = #torroidal
		ifTrue:
			[nbLines > (self line - 2) ifTrue: [nbLines := nbLines - self line + 2].
			nbCols > (self column - 2) ifTrue: [nbCols := nbCols - self column + 2]].
	^(nbLines squared + nbCols squared) sqrt