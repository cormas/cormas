display
show
	"Open an inspector showing self as figure"
	
	| fig |
	fig := self asFigure.	"self asFigure_basic."
	self isStroked
		ifTrue: [fig transparent]
		ifFalse: [fig opaque].
	fig fillColor: self color.
	fig lineColor: self lineColor.
	fig lineWidth: self lineWidth.
	fig inspect