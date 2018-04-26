description - primitives
makeAboutItFirstDate: firstDate lastDate: lastDate authors: list1 emails: list2 comments: additionalText
	
	| text |
	text := (self descriptionTextFromFirstDate: firstDate lastDate: lastDate
		authors: list1 emails: list2 comments: additionalText) asValue.
	ComposedTextView
		open: text
		label: 'About ' , self name
		icon: (Icon constantNamed: #workspace)
		extent: 500 @ 200