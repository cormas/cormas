accessing - entities
allTheEntities: aClass
	"Purpose: Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel. Usefull for abstract classes
Example: (self allTheEntities: Forager) is returning all the instances of restrained and unrestrained foragers"
	
	| coll |
	coll := OrderedCollection new.
	aClass withAllSubclasses
		do: [:cl | cl isAbstract ifFalse: [coll addAll: (self theEntities: cl)]].
	^coll