background
setBackGroundColor
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self drawing backgroundFillColor: color.
	self changed