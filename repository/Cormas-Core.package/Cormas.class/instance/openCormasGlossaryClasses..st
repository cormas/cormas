main menu
openCormasGlossaryClasses: aCollec
	"Purpose: opens Cormas glossary window on hierarchy of classes based on a given superclass"
	
	ComposedTextView
		open: (self class reportTextForClasses: aCollec) asValue
		label: 'Cormas Glossary for ' , aCollec first name asString
		icon: (Icon constantNamed: #workspace)
		extent: 800 @ 700