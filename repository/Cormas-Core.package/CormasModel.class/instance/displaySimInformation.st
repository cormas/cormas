+ user interface
displaySimInformation
	"display information on the current simulation"
	
	ComposedTextView
		open: self getSimDescriptionText asValue
		label: '* About Current Simulation * '
		icon: (Icon constantNamed: #workspace)
		extent: 400 @ 200