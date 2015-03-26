accessing - entities
allTheEntities
	"Returns a collection of all the instances of the Entity (and sub classes) collected by cormasModel"
	
	| coll |
	coll := IndexedSet new.
	self allClasses do: [:cl | coll addAll: (self theEntities: cl)].
	^coll