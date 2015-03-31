interface opening
open_old
	
	| bdr win hauteurOpt ratio largeurOpt origine etendue winType |
	self halt.
	self zoomInterfaceIsStatic
		ifTrue: [winType := #staticWindow]
		ifFalse: [winType := #scrolledWindow].
	bdr := self allButOpenInterface: winType.
	win := bdr window.
	hauteurOpt := Screen default bounds height / 2.
	ratio := self spaceModel absoluteBounds extent
		/
			(self spaceModel absoluteBounds extent x
				min: self spaceModel absoluteBounds extent y).	"(61/23)@1"
	largeurOpt := Screen default bounds width min: hauteurOpt.
	origine := Screen default bounds center.
	etendue := (largeurOpt / ratio y) @ ((85 + hauteurOpt) / ratio x).	"85 =~ la hauteur de la fenetre avec les Tools, menu et cadre"
	win openIn: (origine extent: etendue).
	self setMenuHolder