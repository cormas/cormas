instance-creation
newFrom: image
	"image must be a kind of PixelArray"
	
	| bi |
	bi := self new.
	bi bitmap: (Cormas construireOpaqueImageAvec: image).
	^bi