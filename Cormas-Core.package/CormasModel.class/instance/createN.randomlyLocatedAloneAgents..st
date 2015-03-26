deprecated
createN: aNumber randomlyLocatedAloneAgents: aClass
	"Return a collection of aNumber of entities of aClass for wich the 'init' method has been send.
	The new agents are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAgents: Predator"
	
	self createN: aNumber randomlyLocatedAloneAgents: aClass initMethod: #init
		arguments: #()