interface opening
resizeWindow
	"Resize the SpaceInterface window to fit the spaceModel configuration."
	"	| hauteur largeur origine etendue ratio aSetOfFigures aRectangle |

	aSetOfFigures := self targetPovs collect:[: pov | pov outline].
	aRectangle := aSetOfFigures first bounds.
	aSetOfFigures do: [:fig | aRectangle := aRectangle merge: fig bounds].
	hauteur := (Screen default bounds height min: (Screen default bounds width)) / 2.
	largeur := hauteur.
	ratio := aRectangle extent /
			(aRectangle extent x min: aRectangle extent y).
	etendue := (largeur / ratio y) @ (hauteur / ratio x).
	origine := (Screen default bounds center x - (etendue / 2) x) @ 0.
	self resizeWindow: self builder window toOrigine: origine extent: etendue."
	
	