+ control
stepEntitiesRandom: aCollecOrClass
	"Purpose: Iteration over aCollec or the entities of a class. The elements of aCollec / or the instances of the class, are randomly mixed.
Example: self stepEntities: Farmer
Example: self stepEntities: (self theForagers select:[:f| f energy > 10])"
	
	self askRandom: aCollecOrClass toDo: #step