menus
displaySimInformation
	
	cormasModel_data isNil
		ifTrue:
			[cormasModel displaySimInformation.
			cormasModel getSimDescriptionText]
		ifFalse:
			[ComposedTextView
				open: self simDescriptionText asValue
				label: '* About Current Simulation * '
				icon: (Icon constantNamed: #workspace)
				extent: 400 @ 200]	"display information on the current simulation"