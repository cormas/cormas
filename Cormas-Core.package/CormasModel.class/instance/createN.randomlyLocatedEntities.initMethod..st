+ instance creation - agents & objects
createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge "
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: aSymbol
		arguments: #()