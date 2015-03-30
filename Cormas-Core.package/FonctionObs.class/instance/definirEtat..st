fonctions
definirEtat: unAgentObs
	
	| agentSource i |
	agentSource := populationSource at: unAgentObs nom.
	i := (agentSource activite pChasseur / 10) rounded max: 2.
	unAgentObs etatNoChanged: i