menus
displayLegendOption_top_right
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 3.
	self updateChartsDisplay