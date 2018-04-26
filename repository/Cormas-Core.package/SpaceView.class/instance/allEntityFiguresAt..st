accessing-Figures
allEntityFiguresAt: aClass
	"Return a collection of Figures of aClass and super classes, stored into the entityFigures Dictionary.
entityFigures = [ Predator -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				Prey -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	| coll |
	coll := OrderedCollection new.
	aClass allTerminalClasses
		do: [:cl | coll addAll: (self entityFiguresAt: cl)].
	^coll