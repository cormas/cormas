fonctions
definirEtat: unAgentObs pointDeVue: unEntier
	"	| agentSource i |



	agentSource := populationSource at: unAgentObs nom. 



	unEntier = 1 ifTrue: [i := (agentSource activite pChasseur /10) rounded ].



	unEntier = 2 ifTrue: [i := (agentSource activite pAgriculteur / 50) rounded ].



	i = 0 ifTrue: [ i := 1].



	unAgentObs etatNoChanged: i"
	
	