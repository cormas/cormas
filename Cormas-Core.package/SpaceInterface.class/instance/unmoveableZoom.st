menu - actions
unmoveableZoom
	"self drawing container:  (BoundedWrapper on: (ScrollWrapper on: self drawing ))"
	
	self zoomInterfaceIsStatic: true.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#unmoveableZoom) beOn.
	((self menuHolder value atNameKey: #option) submenu atNameKey:
			#moveableZoom) beOff