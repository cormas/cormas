- probes
probes
	"self superClassesUntilEntity"
	
	| coll |
	coll := IndexedSet new.
	self withAllSuperclasses
		do: [:cl | coll addAll: (cl organization listAtCategoryNamed: #probes)].
	^coll asSortedCollection