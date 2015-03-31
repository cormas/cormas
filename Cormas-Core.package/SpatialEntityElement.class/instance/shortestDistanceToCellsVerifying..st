+ environment - distance
shortestDistanceToCellsVerifying: aCondition
	"Purpose: gets the shortest distance (Manhattan distance in cell unit) to a cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"
	
	| targetCell |
	targetCell := self nearestCellVerifying: aCondition.
	^targetCell isNil
		ifTrue:
			[self cormas warn: 'there is no nearest cell'.
			self halt]
		ifFalse: [self distanceTo: targetCell]