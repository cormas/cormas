canal
populationSourceRemoveAgent: anAgent
	
	anAgent isNil ifTrue: [^self].
	populationObservateur
		do:
			[:anotherAgentObs | anotherAgentObs preferences removeKey: anAgent agentObs].
	observateur modeleObs agents remove: anAgent agentObs.
	anAgent agentObs agentSource: nil.
	anAgent agentObs: nil.
	self populationSource remove: anAgent.
	observateur modeleObs actionDistribuer