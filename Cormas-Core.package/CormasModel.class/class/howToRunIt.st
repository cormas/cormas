+ description
howToRunIt
	
	| txt |
	txt := 'To be written... Sorry...' asText emphasizeAllWith:
			#(#bold #large).
	ComposedTextView
		open: txt asValue
		label: 'How to run ' , self name , '     step-by-step instructions'
		icon: (Icon constantNamed: #workspace)
		extent: 200 @ 50