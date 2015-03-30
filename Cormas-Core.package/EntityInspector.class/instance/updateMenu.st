methods
updateMenu
	
	| menuShow |
	menuShow := ((self builder menuAt: #optionMenu) atNameKey: #show) submenu.
	self showInstance = #selection
		ifTrue:
			[(menuShow atNameKey: #showNo) beOff.
			(menuShow atNameKey: #showColor) beOff.
			(menuShow atNameKey: #showSelection) beOn].
	self showInstance = #no
		ifTrue:
			[(menuShow atNameKey: #showNo) beOn.
			(menuShow atNameKey: #showColor) beOff.
			(menuShow atNameKey: #showSelection) beOff].
	self showInstance = #color
		ifTrue:
			[(menuShow atNameKey: #showNo) beOff.
			(menuShow atNameKey: #showColor) beOn.
			(menuShow atNameKey: #showSelection) beOff]