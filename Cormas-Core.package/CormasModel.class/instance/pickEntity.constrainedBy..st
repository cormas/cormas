+ accessing - entities
pickEntity: aClass constrainedBy: aBlock
	"Purpose: return a random entity belonging to a class and verifying the block condition.
Return Value: an instance of aClass, or nil if there is no intsance verifying the condition 
Example:  self pickEntity: RestrainedForager constrainedBy: [:e| e patch energy <2] "
	
	^Cormas
		selectRandomlyFrom:
			((self allTheEntities: aClass) select: [:c | aBlock value: c])