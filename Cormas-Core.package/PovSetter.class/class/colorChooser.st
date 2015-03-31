colors
colorChooser
	"open a Color chooser.
test it :    PovSetter colorChooser  "
	
	| dialog |
	dialog := ColorSelectionDialog new.
	dialog selection.
	dialog open.
	dialog accept value ifFalse: [^nil].
	^dialog selection