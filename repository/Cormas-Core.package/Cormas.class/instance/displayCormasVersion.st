main menu
displayCormasVersion
	
	| txt |
	txt := '	History of the Cormas versions ' asText emphasizeAllWith:
			#(#bold #large).
	txt := txt , Cormas versionComments.
	ComposedTextView
		open: txt asValue
		label: '* Versions of Cormas * '
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 650