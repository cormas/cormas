deprecated
createN: aNumber randomlyLocatedObjects: aClass constrainedBy: aBlock
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new objects are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedObjects: Ore constrainedBy: [:c |¬†c isLand] "
	
	^self createN: aNumber randomlyLocatedObjects: aClass initMethod: #init
		arguments: #() constrainedBy: aBlock