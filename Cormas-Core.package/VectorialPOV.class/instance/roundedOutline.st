accessing
roundedOutline
	" = a Polyline"
	
	| newPoints |
	newPoints := OrderedCollection new: outline vertices size.	"outline vertices do:[:point | newPoints add: ((point * 100) rounded / 100)]."
	outline vertices do: [:point | newPoints add: point rounded].
	^Polyline vertices: newPoints