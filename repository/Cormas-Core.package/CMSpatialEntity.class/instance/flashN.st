star displaying
flashN
"Purpose: for each neighours, changes background color to yellow (to draw observer attention to the neighbourhood)"

	self neighbourhood isNil 
		ifFalse: [self neighbourhood do: [:v | v flash]]