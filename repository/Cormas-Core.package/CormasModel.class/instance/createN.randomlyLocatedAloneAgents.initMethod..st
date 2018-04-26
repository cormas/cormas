deprecated
createN: aNumber randomlyLocatedAloneAgents: aClass initMethod: aSymbol
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new agents are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAgents: Predator initMethod: #initAge  "
	
	^self createN: aNumber randomlyLocatedAloneAgents: aClass initMethod:
			aSymbol arguments: #()