delimiteur
selectColor
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self view delimiterColor: color