description
howToRunIt

	| dialog |
	
	dialog := LongMessageDialogWindow new
		entryText: self howToInstructions;
		title: 'How to run ' , self name , '     step-by-step instructions';
		yourself.
	dialog open.
	dialog textMorph
		minWidth: 60;
		minHeight: 90.