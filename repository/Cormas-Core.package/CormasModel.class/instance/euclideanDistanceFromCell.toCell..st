+ utilities - space metrics
euclideanDistanceFromCell: cell1 toCell: cell2
	"Purpose: return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"
	
	^self spaceModel euclideanDistanceFromCell: cell1 toCell: cell2