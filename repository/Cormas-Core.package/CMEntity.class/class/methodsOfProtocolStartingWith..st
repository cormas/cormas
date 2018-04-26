- accessing - methods & classes
methodsOfProtocolStartingWith: aString
	"Return a set of all the methods which are in protocols which name starts with aString"
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: CMEntity)
		do:
			[:aClass | 
			(aClass organization categories
				select:
					[:aSymbol | (aSymbol asString findString: aString startingAt: 1) = 1])
				do: [:aP | coll addAll: (aClass organization listAtCategoryNamed: aP)]].
	^coll sorted