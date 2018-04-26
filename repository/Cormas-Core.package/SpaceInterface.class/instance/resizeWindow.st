interface opening
resizeWindow
	"Automatically resize the SpaceInterface window to fit (+/- 5 %) the spaceModel configuration."
	
	| hauteur origine etendue newRatio newExtent previousExtent previousRatio |
	self spaceModel class = ClientSpaceModel
		ifFalse: [self spaceModel autoResizeBounds ifFalse: [^nil]].
	previousExtent := self drawing bounds extent.
	newExtent := self spaceModel absoluteBounds extent.
	Dev todo:
			'c''est pas vraiement normal que la spaceInterface recup√®re le absolutebounds de son mod√®le. il aurai mieux fallu que celui ci lui passe lors de la notification'.
	newRatio := newExtent / (newExtent x min: newExtent y).
	previousRatio := previousExtent / (previousExtent x min: previousExtent y).	"((previousRatio y - newRatio y) / newRatio y) abs > 0.05 ifFalse:[^false]."
	(previousRatio / newRatio
		between: 0.95 * (1 @ 1)
		and: 1.05 * (1 @ 1)) ifTrue: [^false].	"hauteur := self builder window getDisplayBox height max: self builder window getDisplayBox width."
	hauteur := previousExtent x max: previousExtent y.
	etendue := ((hauteur / newRatio y) @ (hauteur / newRatio x)) rounded.
	origine := (Screen default bounds width - etendue x) @ 0.	"origine := self builder window globalOrigin."
	self
		resizeWindow: self builder window
		toOrigine: origine
		extent: etendue