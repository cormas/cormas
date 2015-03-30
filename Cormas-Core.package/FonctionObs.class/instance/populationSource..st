canal
populationSource: uneOC
	
	| tmp unController |
	uneOC isNil ifTrue: [^self].
	populationSource := uneOC.
	populationObservateur := OrderedCollection new.
	populationSource
		do:
			[:unAgent | 
			tmp := AgentObs new.
			tmp agentSource: unAgent.
			tmp preferences: Dictionary new.
			tmp fonction: self.
			tmp addDependent: observateur vueObs.
			unAgent agentObs: tmp.
			populationObservateur add: tmp].
	populationObservateur
		do:
			[:unAgentObs | 
			populationObservateur
				do:
					[:anotherAgentObs | unAgentObs preferences at: anotherAgentObs put: 0]].
	observateur modeleObs agents: populationObservateur.
	observateur modeleObs isInitialized
		ifTrue: [observateur modeleObs actionDistribuer].
	unController := ControllerObs new.
	unController model: observateur modeleObs.
	unController performer: observateur.
	observateur vueObs controller: unController.
	unController initializeMenuCustom