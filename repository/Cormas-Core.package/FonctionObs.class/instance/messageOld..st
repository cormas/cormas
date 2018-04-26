canal
messageOld: unMsg
	
	| intensite |
	(self interceptionMessage: unMsg) ifFalse: [^self].
	intensite := self intensiteLienPour: unMsg.
	lastFrom notNil
		ifTrue:
			[lastFrom cercleCommunication: false.
			lastTo cercleCommunication: false].
	lastFrom := populationObservateur at: unMsg sender.
	lastTo := populationObservateur at: unMsg receiver.
	lastFrom cercleCommunication: true.
	lastTo cercleCommunication: true.
	lastFrom
		incPref: unMsg receiver
		with: intensite x.
	lastTo
		incPref: unMsg sender
		with: intensite y.
	self computeLevel: lastFrom.
	self computeLevel: lastTo.
	observateur actionGo