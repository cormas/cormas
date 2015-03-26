probes
removeProbeItem
	
	<itemInMenu: #(#mainMenu) position: 25.4>
	^(MenuItem labeled: #RemoveProbe >> 'Remove Probe' << #pdp)
		value: [self removeProbe];
		visible:
				[self areProbeCommandsLegal and: [self probesToActUpon size = 1]]