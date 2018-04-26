- activityEditor
superClassesUntil: aSuperClass
	"Return the super classes of the class sender until aSuperClass"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll