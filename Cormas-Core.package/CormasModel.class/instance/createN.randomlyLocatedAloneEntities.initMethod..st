+ instance creation - agents & objects
createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge  "
	
	^self createN: aNumber randomlyLocatedAloneEntities: aClass initMethod:
			aSymbol arguments: #()