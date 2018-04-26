initialize-release
field: selection
	"Set selection to be the currently selected variable."
	
	selection = '----------'
		ifFalse:
			[field := selection.
			self resetText]