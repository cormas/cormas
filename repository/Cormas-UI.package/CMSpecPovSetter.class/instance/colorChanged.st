changed
colorChanged
	| color |
	self builder isNil
		ifTrue: [ ^ self ].
	listSymbols selection isNil
		ifTrue: [ ^ self alertMessage: self translator tSelectSymbol ].
	color := Color
		red: redHolder value
		green: greenHolder value
		blue: blueHolder value.
	color := Color
		hue: color hue
		saturation: color saturation
		brightness: brightnessHolder value.
	(self builder componentAt: #boutonAppliquer) enable.
	couleur := color.
	^ color