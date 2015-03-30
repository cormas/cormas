+ utilities - colors
defaultColor
	"Purpos: return the default color of the current class name.
	Ex: Entity defaultColor => ColorValue lightGray ; CormasNS.Models.ECEC.Forager defaultColor => ColorValue veryLightGray"
	
	| v |
	v := 1.
	self name do: [:char | v := v + char asInteger].
	^self colorOfNumber: v	"^ColorValue red"