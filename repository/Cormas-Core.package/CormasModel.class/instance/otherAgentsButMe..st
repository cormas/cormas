accessing - entities
otherAgentsButMe: anAgent
	"Purpose: Return a collection of all agents from anAgent class, except itself"
	
	^(self theEntities: anAgent class) select: [:other | other ~= anAgent]