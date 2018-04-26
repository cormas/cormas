deprecated
createN: aNumber randomlyLocatedObjects: aClass
	"Return a collection of aNumber of entities of aClass for wich the 'init' method has been send.
	The new objects are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedObjects: Ore"
	
	^self createN: aNumber randomlyLocatedObjects: aClass initMethod: #init
		arguments: #()