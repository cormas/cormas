- accessing - methods & classes
superClassesInSameEnvironmentUntil: aSuperClass
	"Purpose: returns the list of super classes of the receiver that share the same environment up to aSuperClass
Return value: an orderedCollection
Example: FarmerTypeA superClassesInSameEnvironmentUntil: Agent"
	
	| coll |
	coll := self withAllSuperclasses select: [ : aClass | aClass cmEnvironment = self cmEnvironment and: [aClass inheritsFrom: aSuperClass]].
	aSuperClass cmEnvironment = self cmEnvironment 
		ifTrue: [ coll add: aSuperClass ].
	^ coll