probes
addProbe
	
	<menuItem: #(#InsertProbeDots #pdp 'Insert Probe...') nameKey: nil
		enablement: #areProbeCommandsLegal indication: nil menu: #(#mainMenu)
		position: 25.2>
	| probedMethod unprobedMethod probe probeSpec aController |
	aController := self textController.
	self selector isNil
		ifTrue:
			[^Dialog
				warn:
					#InsertProbeValidWhenMethodSelected << #pdp >>
							'The "insert probe" operation is only
valid when a method is selected.'].
	aController textHasChanged
		ifTrue:
			[^Dialog
				warn:
					(#ProbeCannotBeInsertedSourceChanged << #pdp >>
							'A probe cannot be inserted because<1s>     the source code has changed.'
						expandMacrosWith: (String with: Character cr))].
	probeSpec := CodeProbe selectBrowserProbeType.
	probeSpec == nil ifTrue: [^nil].
	unprobedMethod := self selectedMethod.
	probedMethod := unprobedMethod newFullProbedMethod.
	probedMethod isNil ifTrue: [^self].
	PDPManager debugActive
		ifFalse:
			[PDPTransientWarning
				on: #ProbesAreDisabled << #pdp >> 'Probes are disabled'].
	probe := self
		makeProbeTyped: probeSpec probeClass
		using: nil
		at: aController selectionRange
		method: probedMethod.
	probe isNil ifTrue: [^self].
	probedMethod addProbe: probe.
	probe makeConditional: probeSpec replacing: unprobedMethod with:
			probedMethod