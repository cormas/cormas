tool hotDraw
disableAllTools
	"desable all the tool buttons in the toolbar"
	
	1
		to: buttons list size
		do:
			[:i | (buttons list at: i) value ifNotNil: [self disableToolNumber: i]]