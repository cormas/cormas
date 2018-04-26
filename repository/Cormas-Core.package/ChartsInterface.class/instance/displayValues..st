menus
displayValues: aBool
	
	displayValues := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayValues) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey:
					#displayValues) beOff].
	self updateChartsDisplay