- accessing - methods & classes
allInstanceSelectors
	"Purpose:returns the list of all methods defined at instance level
Return value: an indexedSet
Example: CormasNS.Kernel.Agent allInstanceSelectors"
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: Object)
		do: [:aClass | coll addAll: aClass selectors].
	^coll