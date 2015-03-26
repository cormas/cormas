probes
addBreakpoint: aProbe
	
	| probedMethod unprobedMethod aController |
	aController := self textController.
	unprobedMethod := self selectedMethod.
	probedMethod := unprobedMethod newFullProbedMethod.
	probedMethod ifNil: [^self].
	PDPManager debugActive
		ifFalse:
			[Transcript show: #ProbesAreDisabled << #pdp >> 'Probes are disabled'].
	aProbe record: (probedMethod probeRecordFor: aController selectionRange).
	probedMethod addProbe: aProbe.
	aProbe unconditionallyInsertInto: probedMethod replacing: unprobedMethod