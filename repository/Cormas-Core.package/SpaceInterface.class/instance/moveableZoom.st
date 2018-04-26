menu - actions
moveableZoom
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: false.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOff.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOn