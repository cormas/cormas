manipulate
chooseLineColor
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self lineColor: color