accessing-Figures
entityFiguresAt: aClass
	"Return a collection of Figures  of aClass stored into the entityFigures Dictionary.
entityFigures = [ Predator -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				Prey -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	^(self entityFigures
		at: aClass
		ifAbsent: [^#()]) values