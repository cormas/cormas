+ accessing - entities
pickN: anInteger entities: aClass
	"Purpose: return a collection of entities belonging to a class .
Return Value: a collection of instances of aClass, or an empty collection if there is no intsance 
Example:  self pickN: 5 entities: Forager "
	
	^Cormas
		selectRandomlyFrom: (self allTheEntities: aClass)
		subCollectionSize: anInteger