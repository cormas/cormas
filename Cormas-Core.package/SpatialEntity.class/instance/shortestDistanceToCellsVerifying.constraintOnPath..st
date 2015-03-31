+ environment - distance
shortestDistanceToCellsVerifying: aCondition constraintOnPath: aBlock
	"Purpose: gets the shortest distance (in cell unit) to a cell verifying a specified condition, taking a specified constraint on the path into account.
Arguments: aCondition = <BlockClosure>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest] constraintOnPath: [:c | c isClosed not]"
	
	| targetCell |
	targetCell := self nearestCellVerifying: aCondition constraintOnPath:
			aBlock.
	^targetCell isNil
		ifTrue:
			[self cormas warn: 'there is no nearest cell'.
			self halt]
		ifFalse: [self distanceTo: targetCell]