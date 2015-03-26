deprecated
createN: aNumber randomlyLocatedAgents: aClass
	"Return a collection of aNumber of entities of aClass for wich the 'init' method 'has been send.
The new agents are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedAgents: Predator"
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: #init