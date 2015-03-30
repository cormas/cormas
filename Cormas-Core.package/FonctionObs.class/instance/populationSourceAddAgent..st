canal
populationSourceAddAgent: anAgent
	
	| tmp |
	anAgent isNil ifTrue: [^self].
	tmp := AgentObs new.
	tmp agentSource: anAgent.
	tmp preferences: Dictionary new.
	tmp fonction: self.
	tmp addDependent: observateur vueObs.
	anAgent agentObs: tmp.
	populationObservateur add: tmp.
	populationObservateur
		do:
			[:anotherAgentObs | 
			tmp preferences at: anotherAgentObs put: 0.
			anotherAgentObs preferences at: tmp put: 0].
	observateur modeleObs actionDistribuer