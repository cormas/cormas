as yet unclassified
allAttributesUntil: aSuperClass
"Purpose: returns the list of attributes of the receiver up to aSuperClass
Return value: an orderedCollection
Example: GroupLocation allAttributesUntil: Agent"
	| coll |
	coll := IndexedSet new.
	(self superClassesUntil: aSuperClass) do: [: cl | coll addAll: cl instVarNames].
	^coll asList