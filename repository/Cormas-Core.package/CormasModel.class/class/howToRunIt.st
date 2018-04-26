+ description
howToRunIt
	
	| dialog |
	
	dialog := LongMessageDialogWindow new
		entryText: 'To be written... sorry';
		title: 'How to run ' , self name , '     step-by-step instructions';
		yourself.
	dialog open.
	dialog textMorph
		minWidth: 60;
		minHeight: 90.
