interface opening
openIn: aRectangle
	"Open the editor interface into the specified rectangle, corrected by the current screen on which the stored editor is opened"
	
	| win newRectangle height width origine |
	height := Screen default bounds height min: aRectangle height.
	width := Screen default bounds width min: aRectangle width.
	origine := aRectangle origin.
	origine x + width > Screen default bounds width
		ifTrue: [origine x: Screen default bounds width - width].
	origine y + height > Screen default bounds height
		ifTrue: [origine y: Screen default bounds height - height].
	newRectangle := Rectangle origin: origine width: width height: height.
	win := (self allButOpenInterface: #windowSpec) window.
	^win openIn: newRectangle