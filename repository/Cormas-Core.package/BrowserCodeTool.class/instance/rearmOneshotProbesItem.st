probes
rearmOneshotProbesItem
	
	<itemInMenu: #(#mainMenu) position: 25.16>
	^(MenuItem labeled: #RearmProbes >> 'Rearm Oneshot Probes' << #pdp)
		value: [self rearmOneshotProbes];
		visible:
				[self areProbeCommandsLegal
						and:
							[self probesToActUpon
								anySatisfy: [:each | each isOneshot and: [each isArmed not]]]]