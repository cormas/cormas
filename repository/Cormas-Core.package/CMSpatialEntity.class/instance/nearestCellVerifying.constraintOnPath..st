+ environment - picking - space
nearestCellVerifying: condition1 constraintOnPath: condition2
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Generic method to be used for polygonal cells and compound spatial entities. For cells (elementary square or hexagonal spatial entities), see methods in class SpatialEntitryElement 
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	self subclassResponsibility