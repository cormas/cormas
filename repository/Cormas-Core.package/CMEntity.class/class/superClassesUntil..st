- accessing - methods & classes
superClassesUntil: aSuperClass
	"Purpose: returns the list of super classes of the receiver up to aSuperClass
Return value: an orderedCollection
Example: GroupLocation superClassesUntil: Agent"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll