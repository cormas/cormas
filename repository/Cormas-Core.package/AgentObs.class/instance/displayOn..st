display
displayOn: aGC
	
	self agentSource displayOn: aGC at: centre.
	aGC
		displayString: self agentSource id printString
		at:
			(centre x + (self agentSource class image wp component bounds width * 0.7))
				@ centre y.
	Lien
		ifTrue:
			[preferences keys
				do:
					[:unAgentObs | 
					(self Attirant: unAgentObs)
						ifTrue: [fonction showLink: self to: unAgentObs withGC: aGC]]].
	cercleCommunication
		ifTrue:
			[(Circle center: centre radius: 10) asStroker
				displayOn: (aGC paint: (ColorValue perform: #black))].
	displayForces ifTrue: [self showForces: aGC]