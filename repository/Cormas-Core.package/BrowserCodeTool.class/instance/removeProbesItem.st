probes
removeProbesItem
	
	<itemInMenu: #(#mainMenu) position: 25.4>
	^(MenuItem labeled: #RemoveProbes >> 'Remove Probes' << #pdp)
		value: [self removeProbe];
		visible:
				[self areProbeCommandsLegal and: [self probesToActUpon size > 1]]