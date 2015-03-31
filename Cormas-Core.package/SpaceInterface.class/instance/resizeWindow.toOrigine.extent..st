interface opening
resizeWindow: win toOrigine: origine extent: newSpaceViewExtent
	"resize the SpaceInterface window to fit the spaceModel configuration.
SpaceInterface adds decoration + menu + Tools bar. If interface is very thin, the menu may be of 2 or 3 lines. So we have to adapt the window size after opening the interface"
	
	| windowExtraHeight orig ext |
	windowExtraHeight := win height - self drawing bounds extent y.
	orig := (origine
		+ (-10 @ LookPreferences edgeDecorationPolicy markerThickness)) rounded.
	orig y < 30 ifTrue: [orig y: 30].
	ext := (newSpaceViewExtent + (0 @ windowExtraHeight)) rounded.
	win displayBox: (orig extent: ext).	"modification origin"
	(win getDisplayBox corner x > Screen default bounds width
		or: [win getDisplayBox origin y < 30])
		ifTrue:
			[orig := orig
				+
					((Screen default bounds width - win getDisplayBox corner x - 10)
						@ (30 - win getDisplayBox origin y max: 0)).
			win displayBox: (orig extent: ext)].	"when newSpaceViewExtent is too thin, the window does not respect the specified dimension, so we need to increase the height"
	win getDisplayBox extent x > ext x
		ifTrue:
			[ext := (win getDisplayBox extent
				* (1 @ (win getDisplayBox extent x / ext x))) rounded.
			ext y: (ext y min: Screen default bounds corner y - 35).
			win displayBox: (orig extent: ext)]