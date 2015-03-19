as yet unclassified
methodsOfProtocolStartingWith: aString
	"Return a set of all the methods which are in protocols which name starts with aString"

	| coll |
	coll := IndexedSet new.
	(self superClassesUntil: Entity) do: 
			[:aClass | (aClass organization categories
							select:[:aSymbol| (aSymbol asString findString: aString startingAt:1) = 1])
							do:[:aP| coll addAll: (aClass organization listAtCategoryNamed: aP)]].
	^coll sorted