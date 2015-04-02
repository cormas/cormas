main menu
displayModelVersion
	
	| txt |
	self cormasModelClass isNil
		ifTrue: [^self warn: 'Select or create a model'].
	txt := ('	History of ' , self cormasModelClass name , ''' versions ')
		asText emphasizeAllWith: #(#bold #large).
	txt := txt , self cormasModelClass versionComments.
	ComposedTextView
		open: txt asValue
		label: '* Versions of ' , self cormasModelClass name , ' * '
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 650