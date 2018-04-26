menu - actions
activateLegend
	
	((self menuHolder value atNameKey: #tools) submenu atNameKey:
			#activateLegend) isOn
		ifTrue:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOff.
			self legend legendes
				do:
					[:leg | leg builder window isOpen ifTrue: [leg builder window unmap]]]
		ifFalse:
			[((self menuHolder value atNameKey: #tools) submenu atNameKey:
					#activateLegend) beOn.
			self legend legendes
				do:
					[:leg | 
					(leg isOpened and: [leg builder window isOpen])
						ifFalse:
							[leg builder window openIn: leg builder window displayBox.
							leg isOpened: true]
						ifTrue: [leg builder window map]]]