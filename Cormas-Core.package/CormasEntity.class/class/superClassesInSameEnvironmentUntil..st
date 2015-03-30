- accessing - methods & classes
superClassesInSameEnvironmentUntil: aSuperClass
	"Purpose: returns the list of super classes of the receiver that share the same environment up to aSuperClass
Return value: an orderedCollection
Example: FarmerTypeA superClassesInSameEnvironmentUntil: Agent"
	
	| coll |
	coll := self withAllSuperclasses
		select:
			[:aClass | 
			aClass environment = self environment
				and: [aClass inheritsFrom: aSuperClass]].
	aSuperClass environment = self environment ifTrue: [coll add: aSuperClass].
	^coll