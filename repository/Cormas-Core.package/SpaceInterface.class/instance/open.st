interface opening
open
	"Open the SpaceInterface adapted to the spaceModel configuration."
	
	| bdr win hauteur largeur origine etendue ratio screenBounds absBounds |
	screenBounds := Screen default bounds.
	hauteur := (screenBounds height min: screenBounds width) / 2.
	largeur := hauteur.
	origine := (screenBounds width - largeur) @ 0.
	absBounds := self spaceModel absoluteBounds.
	ratio := absBounds extent / (absBounds extent x min: absBounds extent y).
	etendue := (largeur / ratio y) @ (hauteur / ratio x max: 70).
	bdr := self allButOpenInterface: #windowSpec.
	win := bdr window.
	win openIn: (origine extent: etendue).	"self resizeWindow: win toOrigine: origine extent: etendue."	"self displayGrid."
	self setMenuHolder