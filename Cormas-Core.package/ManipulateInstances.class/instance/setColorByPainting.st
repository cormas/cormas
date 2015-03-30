actions while painting
setColorByPainting
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self initializeByPainting.
	self linkedSpaceInterface view manipulationAction: #coloring.
	self linkedSpaceInterface view
		manipulationActionArguments: (List with: color)