+ environment - distance
shortestDistanceToCellsVerifying: aCondition
	"Purpose: gets the shortest distance (in cell unit) to a cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"
	
	self subclassResponsibility