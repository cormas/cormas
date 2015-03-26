menus
displayLegendOption_hide
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	chartsView legendLocation: 0.
	self updateChartsDisplay