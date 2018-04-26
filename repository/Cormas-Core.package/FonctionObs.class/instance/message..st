canal
message: unMsg
	
	| intensite |
	(self interceptionMessage: unMsg) ifFalse: [^self].
	self window isOpen
		ifTrue:
			[intensite := self intensiteLienPour: unMsg.
			lastFrom notNil
				ifTrue:
					[lastFrom cercleCommunication: false.
					lastTo cercleCommunication: false].
			lastFrom := unMsg sender agentObs.
			lastTo := unMsg receiver agentObs.
			lastFrom cercleCommunication: true.
			lastTo cercleCommunication: true.
			lastFrom
				incPref: unMsg receiver agentObs
				with: intensite x.
			lastTo
				incPref: unMsg sender agentObs
				with: intensite y.
			self computeLevel: lastFrom.
			self computeLevel: lastTo.
			lastTo displayOn: observateur vueObs graphicsContext.
			lastFrom displayOn: observateur vueObs graphicsContext.
			observateur actionGo]