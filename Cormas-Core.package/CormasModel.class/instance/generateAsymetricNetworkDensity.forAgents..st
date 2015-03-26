+ init - social network
generateAsymetricNetworkDensity: x forAgents: aClass
	"Purpose: As a result of this method, the acquaintances attribute of each agent is set with a collection of other agents, randomly picked. The size of this collection is the ratio x of the total population. The method loops on each agent and link it with the requested number of other agents of the same class.
The relation is not symetric, it means agent A may know agent B but B may not know A
Argument: x is a ratio of the total population of agents of aClass. Its value is between 0 and 1.
Example: self generateAsymetricNetworkDensity: 0.6 forAgents: Citizen"
	
	| allAgents n otherAgents |
	allAgents := self theEntities: aClass.
	n := (x * allAgents size) truncated.
	allAgents
		do:
			[:a | 
			a acquaintances size < n
				ifTrue:
					[otherAgents := Cormas mixt: (self otherAgentsButMe: a).
					1
						to: n
						do: [:i | a acquaintances add: (otherAgents at: i)]]]