tool hotDraw
disableToolNumber: anInteger
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	| previous |
	previous := buttons selectionIndex.
	buttons selectionIndex: anInteger.
	buttons selection disable.
	buttons selectionIndex: previous