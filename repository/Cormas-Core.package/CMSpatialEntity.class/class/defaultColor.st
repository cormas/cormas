+ utilities - colors
defaultColor
	"Purpos: return the default color of the current class name.
	Ex: Entity defaultColor => ColorValue lightGray ; CormasNS.Models.ECEC.Forager defaultColor => ColorValue veryLightGray"
	
	self colorsDict isEmpty
		ifTrue: [^super defaultColor]
		ifFalse:
			[^self colorsDict
				at: self name
				ifAbsent: [super defaultColor]]