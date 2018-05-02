accessing - entities
allTheSituatedEntities
	"Returns a collection of all the instances of AgentLocation and of ObjectLocation (and sub classes) collected by cormasModel, which are situated on a patch"
	
	^self allTheEntities select: [:entity | entity isSituated]