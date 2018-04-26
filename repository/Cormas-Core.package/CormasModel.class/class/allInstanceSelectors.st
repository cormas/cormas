- activityEditor
allInstanceSelectors
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: Object)
		do: [:aClass | coll addAll: aClass selectors].
	^coll