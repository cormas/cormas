deprecated
createN: aNumber randomlyLocatedAloneObjects: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new objects are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneObjects: Ore initMethod: #init  "
	
	^self createN: aNumber randomlyLocatedAloneObjects: aClass initMethod:
			aSymbol arguments: #()