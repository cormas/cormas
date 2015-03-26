deprecated
createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new objects are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedObjects: Ore initMethod: #init "
	
	^self createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol
		arguments: #()