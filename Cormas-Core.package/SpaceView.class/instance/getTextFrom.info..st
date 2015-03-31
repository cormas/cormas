accessing-Figures
getTextFrom: aClass info: infoSymbol
	"return a collection of TextFigures from the Entity (aClass) and subclasses"
	
	^self model cormasModel allEntitiesFrom: aClass getInfoFor: infoSymbol