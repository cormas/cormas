tool hotDraw
enableToolNumber: anInteger
	"anInteger refers to the order of the tool in the toolbar 
1 is for inspect tool"
	
	| previous |
	previous := buttons selectionIndex.
	buttons selectionIndex: anInteger.
	buttons selection enable.
	buttons selectionIndex: previous