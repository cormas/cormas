+ control
stepEntities: aCollecOrClass
	"Purpose: Iteration over aCollec or the entities of a class. In case aCollecOrClass is a class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is kept.
Example: self stepEntities: Farmer
Example: self stepEntities: (self theForagers select:[:f| f energy > 10])"
	
	self ask: aCollecOrClass toDo: #step