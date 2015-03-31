examples
example
	"Open a drawing editor with an Hexagon inside"
	"   self example   "
	
	| editor figure |
	editor := self new.
	editor open.
	figure := (HexagonPOV fromRadius: 10) asFigure.	"createAt: (10 @ 10 corner: 50 @ 50)"	"figure corner: 50 @ 50."
	editor drawing add: figure.
	figure translateTo: editor drawing center - (figure extent / 2).
	^editor