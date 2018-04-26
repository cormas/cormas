+ description
aboutIt
	
	| dialog |
	
	dialog := LongMessageDialogWindow new
		entryText: self getDescriptionText;
		title: 'About ' , self name;
		yourself.
	dialog open.
	dialog textMorph
		minWidth: 60;
		minHeight: 90.	
