accessing - entities
allTheSituatedEntities: aClass
	"Purpose: Returns a collection of all the situated instances of aClass (and sub classes) collected by cormasModel. Usefull for abstract classes
Example: (self allTheSituatedEntities: Forager) is returning all the instances of restrained and unrestrained foragers that are situated on the space"
	
	| coll |
	coll := OrderedCollection new.
	aClass withAllSubclasses
		do:
			[:cl | 
			cl isAbstract
				ifFalse:
					[coll addAll: ((self theEntities: cl) select: [:e | e isSituated])]].
	^coll