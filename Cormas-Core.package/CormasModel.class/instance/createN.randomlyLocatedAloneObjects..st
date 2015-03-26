deprecated
createN: aNumber randomlyLocatedAloneObjects: aClass
	"Return a collection of aNumber of entities of aClass for wich the 'init' method has been send.
	The new objects are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneObjects: Ore"
	
	self createN: aNumber randomlyLocatedAloneObjects: aClass initMethod:
			#init arguments: #()