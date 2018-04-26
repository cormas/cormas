probes
modifyProbeItem
	
	<itemInMenu: #(#mainMenu) position: 25.3>
	^(MenuItem labeled: #EditProbeDots >> 'Edit Probe...' << #pdp)
		value: [self modifyProbe];
		enablement:
				[self areProbeCommandsLegal and: [self selectedMethod isProbed]]