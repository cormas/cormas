color
color
	"Answer the color (ColorValue or Image) to use when displaying the receiver on a menu.  If none is specified answer nil."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment color]