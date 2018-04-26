+ init - social network
generateSymetricNetworkDensity: x forAgents: aClass
	"Purpose: As a result of this method, the acquaintances attribute of each agent is set with a collection of other agents, randomly picked. The size of this collection is the ratio x of the total population. The method loops on each agent and link it with the requested number of other agents of the same class.
The relation is  symetric, it means if agent A knows agent B, B will know A.
Argument: x is a ratio of the total population of agents of aClass. Its value is between 0 and 1.
Example: self generateSymetricNetworkDensity: 0.3 forAgents: Citizen"
	
	| allAgents n otherAgents |
	allAgents := Cormas mixt: (self theEntities: aClass).
	n := (x * allAgents size) truncated.
	allAgents
		do:
			[:a | 
			otherAgents := Cormas
				mixt:
					((self otherAgentsButMe: a) select: [:o | o acquaintances size < n]).
			1
				to: (n min: otherAgents size)
				do:
					[:i | 
					a acquaintances size < n
						ifTrue:
							[a acquaintances add: (otherAgents at: i).
							(otherAgents at: i) acquaintances add: a]]]