+ accessing - entities
pickEntity: aClass
	"Purpose: return an entity belonging to a class, picked randomly.
Return Value: an instance of aClass, or nil if there is no intsance  
Example:  self pickEntity: RestrainedForager "
	
	^Cormas selectRandomlyFrom: (self allTheEntities: aClass)