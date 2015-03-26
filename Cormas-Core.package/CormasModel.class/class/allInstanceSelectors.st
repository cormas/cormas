- activityEditor
allInstanceSelectors
	
	| coll |
	coll := IndexedSet new.
	(self superClassesUntil: Object)
		do: [:aClass | coll addAll: aClass selectors].
	^coll