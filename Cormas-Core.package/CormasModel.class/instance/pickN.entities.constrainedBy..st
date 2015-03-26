+ accessing - entities
pickN: anInteger entities: aClass constrainedBy: aBlock
	"Purpose: return a collection of entities belonging to a class and verifying a condition.
Return Value: a collection of instances of aClass, or an empty collection if there is no intsance verifying the condition 
Example:  self pickN: 5 entities: Forager constrainedBy: [:e| e energy > 50] "
	
	^Cormas
		selectRandomlyFrom:
			((self allTheEntities: aClass) select: [:c | aBlock value: c])
		subCollectionSize: anInteger