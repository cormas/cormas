accessing - entities
theAgentsComm
	"Returns a collection of all the communicating agents (social agents) of the model"
	
	^self theAgents select: [:ag | ag isAgentComm]