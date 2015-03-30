hierarchie
computeLevel: agentObs
	"Calcul le niveau d'un agent de l'observateur"
	
	| nb |
	nb := 0.
	agentObs preferences keys
		do: [:p | (agentObs Attirant: p) ifTrue: [nb := nb + 1]].
	agentObs level: (nb / degreMax) ceiling