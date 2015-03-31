tool hotDraw
enableAllTools
	
	1
		to: buttons list size
		do:
			[:i | (buttons list at: i) value ifNotNil: [self enableToolNumber: i]]