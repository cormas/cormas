interface opening
openWithWindowMotionFromInitialFigures: aSetOfFigures
	
	| win hauteur ratio largeur origine etendue winType aRectangle bdr |
	self zoomInterfaceIsStatic
		ifTrue: [winType := #staticWindow]
		ifFalse: [winType := #scrolledWindow].	"Calculus of the SpaceView dimensions"
	aRectangle := aSetOfFigures first bounds.
	aSetOfFigures do: [:fig | aRectangle := aRectangle merge: fig bounds].
	hauteur := (Screen default bounds height min: Screen default bounds width)
		/ 2.
	largeur := hauteur.
	ratio := aRectangle extent
		/ (aRectangle extent x min: aRectangle extent y).	"(61/23)@1"
	etendue := (largeur / ratio y) @ (hauteur / ratio x).
	origine := (Screen default bounds center x - (etendue / 2) x) @ 0.	"un degrad√© wunderbach"
	Screen default
		zoom:
			(aRectangle
				translatedBy:
					aSetOfFigures first container model spatialGridArea origin)
		to: (origine extent: etendue)
		duration: 200.	"First opening of the interface"
	bdr := self allButOpenInterface: winType.
	win := bdr window.
	win openIn: (origine extent: etendue).	"SpaceInterface adds decoration + menu + Tools bar. If interface is very thin, the menu may be of 2 or 3 lines. So we have to adapt the window size after opening the interface"
	self resizeWindow: win toOrigine: origine extent: etendue.	"	windowExtraHeight := 52.
	etendue x < largeur ifTrue:[ ((etendue x / etendue y) <  (246 / 525)) ifTrue:[ ((etendue x / etendue y) <  (144 / 525)) ifFalse:[windowExtraHeight := 80] ifTrue:[windowExtraHeight := 152]]].
	etendue x < 105 ifTrue:[windowExtraHeight := Screen default bounds height min: (windowExtraHeight + (5*(105 - etendue x)))].
	etendue := ((etendue x) @ (etendue y + windowExtraHeight))."	"windowExtraHeight :=(LookPreferences edgeDecorationPolicy markerThickness) + (win component components first bounds extent y) + ((win component components last component components at: 1) component bounds extent y)."	"	windowExtraHeight := win height - ((win component components last component components at: 1) component bounds extent y).
	win displayBox: ((origine + LookPreferences edgeDecorationPolicy markerThickness) rounded extent: (etendue + (1@(windowExtraHeight + LookPreferences edgeDecorationPolicy markerThickness)))rounded)."
	self setMenuHolder