as yet unclassified
allTheLocatedEntities
	"Returns a collection of all the instances of AgentLocation and of ObjectLocation (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isClassLocation]