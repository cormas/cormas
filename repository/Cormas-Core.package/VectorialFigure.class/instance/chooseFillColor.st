manipulate
chooseFillColor
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self fillColor: color