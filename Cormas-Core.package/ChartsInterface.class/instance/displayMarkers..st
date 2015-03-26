menus
displayMarkers: aBool
	
	displayMarkers := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayMarkers) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayMarkers) beOff].
	self updateChartsDisplay