accessing-Figures
entityFigures
	"Store the figures (SpatialEntityCoordinates scaled to the window size) of anEntity into entityFigures (an identityDictionary ).
entityFigures = [ class -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)
				class2 -> anIdentityDictionary (aPOV -> aFigure aPOV -> aFigure...)]"
	
	^entityFigures ifNil: [entityFigures := Dictionary new]