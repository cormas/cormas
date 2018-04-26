colors
colorChooser
	"open a Color chooser.
	test it : CMPovSetter colorChooser  "

	^ (UITheme builder newColorChooserFor: World
		getColor: #color
		setColor: #color:
		help: self translator tChooseTokenColor) open.
