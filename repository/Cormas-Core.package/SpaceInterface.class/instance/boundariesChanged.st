menus
boundariesChanged
	"gere le menu Forme des cellules "
	
	| menuCloture |
	self updateWindowName.
	menuCloture := self menuGridboundaries.
	spaceModel boundaries = #closed
		ifTrue:
			["cellules fermees"
			(menuCloture atNameKey: #torroidal) beOff.
			(menuCloture atNameKey: #closed) beOn]
		ifFalse:
			["cellules toroidales"
			(menuCloture atNameKey: #torroidal) beOn.
			(menuCloture atNameKey: #closed) beOff]