+ description
aboutIt
	
	| text |
	text := self getDescriptionText asValue.
	ComposedTextView
		open: text
		label: 'About ' , self name
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 400