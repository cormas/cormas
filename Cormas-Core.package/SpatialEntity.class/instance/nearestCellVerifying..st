+ environment - picking - space
nearestCellVerifying: aCondition
	"Purpose: returns the nearest cell verifying a condition specified as aBlock.
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>
Generic method to be used for polygonal cells and compound spatial entities. For cells (elementary square or hexagonal spatial entities), see methods in class SpatialEntitryElement 
Example := self nearestCellVerifying: [:aCell | aCell landCover = #water]"
	
	^self
		nearestCellVerifying: aCondition
		constraintOnPath: [:aCell | true]