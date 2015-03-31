ESE (regular) - special locations
cellsBetweenLine1: lineNumber1 line2: lineNumber2 andColumn1: colNumber1 column2: colNumber2
	"Return the cells between the lines lineNumber1 and lineNumber2, and between the columns colNumber1 and colNumber2 of the spatial grid. The Cells are sorted by id.
lineNumber1   <Integer> lineNumber = Positive Integer
lineNumber2   <Integer> colNumber = Positive Integer
colNumber1   <Integer> lineNumber = Positive Integer
colNumber2   <Integer> colNumber = Positive Integer
Ex:  cellsBetweenLine1: 1 line2: 6 andColumn1: 2 column2: 3  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"
	
	| l1 l2 c1 c2 |
	l1 := lineNumber1 min: lineNumber2.
	l2 := lineNumber1 max: lineNumber2.
	c1 := colNumber1 min: colNumber2.
	c2 := colNumber1 max: colNumber2.
	^self
		cellsIntoRectangle:
			(Rectangle
				origin: l1 @ c1
				corner: l2 @ c2)