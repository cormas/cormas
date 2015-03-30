canal
creerSocieteObsFromSocieteSource: listeAgentsSource
	
	| cardinal tmp pref |
	listeAgentsSource isNil ifTrue: [^self].
	populationSource := listeAgentsSource.
	cardinal := populationSource size.
	populationObservateur := Array new: cardinal withAll: nil.
	1
		to: cardinal
		do:
			[:i | 
			tmp := AgentObs new.
			tmp agentSource: (populationSource at: i).
			tmp adaptor: adaptor.
			tmp fonction: self.
			tmp nom: i.
			tmp addDependent: observateur vueObs.
			populationObservateur at: i put: tmp].
	populationObservateur
		do:
			[:a | 
			a preferences: (Array new: cardinal withAll: nil).
			1
				to: cardinal
				do:
					[:i | 
					pref := Pref on: (populationObservateur at: i).
					a preferences at: i put: pref]].
	observateur modeleObs agents: populationObservateur.
	observateur modeleObs isInitialized
		ifTrue: [observateur modeleObs actionDistribuer]