deprecated
createN: aNumber randomlyLocatedAgents: aClass constrainedBy: aBlock
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
The new agents are randomly located on the grid on cells that verify the constraint.
	ex: self createN: 10 randomlyLocatedAgents: Predator constrainedBy: [:c | c noOccupant and: [c energy > 1]]"
	
	^self createN: aNumber randomlyLocatedAgents: aClass initMethod: #init
		arguments: #() constrainedBy: aBlock