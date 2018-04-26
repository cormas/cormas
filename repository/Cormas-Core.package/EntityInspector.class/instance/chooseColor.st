actions
chooseColor
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self instanceColor: color.
	self updateInstanceShow