changed
colorChanged
	
	| color |
	self builder isNil ifTrue: [^self].
	listSymbols selection isNil
		ifTrue:
			[^self cormas
				warn:
					(UserMessage defaultString: 'Select a symbol !!!' key: #selectSymbol)
						asString].
	color := ColorValue
		red: redHolder value
		green: greenHolder value
		blue: blueHolder value.
	color := ColorValue
		hue: color hue
		saturation: color saturation
		brightness: brightnessHolder value.
	(self builder componentAt: #boutonAppliquer) enable.
	couleur := color.
	^color