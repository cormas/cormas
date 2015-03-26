menus
autoScale: aBool
	
	autoScale := aBool.
	aBool
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #autoScale)
				beOff.
			chartsView grid y autoScale.
			chartsView grid y scale zero: 0]
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #autoScale)
				beOn.
			chartsView grid y manualScale].
	self updateChartsDisplay