accessing - entities
allTheEntities
	"Returns a collection of all the instances of the Entity (and sub classes) collected by cormasModel"
	
	| coll |
	coll := OrderedCollection new.
	self class allEntityClasses do: [:cl | coll addAll: (self theEntities: cl)].
	^coll