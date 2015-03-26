accessing - entities
allThePassiveObjects
	"Returns a collection of all the instances of PassiveObject (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isPassiveObject]