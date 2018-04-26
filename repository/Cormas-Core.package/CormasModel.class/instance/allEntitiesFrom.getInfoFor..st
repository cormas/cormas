- pov and info
allEntitiesFrom: aClass getInfoFor: infoSymbol
	"return a collection of info from all entities inheriting from aClass"
	
	^(self allTheEntities: aClass)
		collect: [:each | each getInfoFor: infoSymbol]