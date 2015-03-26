menus
displayLegendOption_bottom_right
	
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_right) beOn.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_right) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #top_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #bottom_left) beOff.
	(((self menuHolder value atNameKey: #Option) submenu atNameKey:
			#displayLegend) submenu atNameKey: #hide) beOff.
	chartsView legendLocation: 14.
	self updateChartsDisplay