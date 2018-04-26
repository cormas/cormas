accessing - entities
allTheLocatedObjects
	"Returns a collection of all the instances of ObjectLocation (and sub classes) collected by cormasModel"
	
	^self allTheEntities select: [:entity | entity isObjectLocation]