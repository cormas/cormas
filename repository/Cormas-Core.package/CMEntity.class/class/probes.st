- probes
probes
	"self superClassesUntilEntity"
	
	| coll |
	coll := OrderedCollection new.
	self withAllSuperclasses
		do: [:cl | coll addAll: ((Pragma allNamed: #probes in: cl) collect: #selector)].
	^coll asSortedCollection
	
