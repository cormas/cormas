menus
displayLegendOption_bottom_left
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 13.
	self updateChartsDisplay