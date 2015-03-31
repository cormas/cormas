actions
removeEntityListName: aSymbol
	
	| x |
	(self perform: aSymbol) selection
		ifNil: [^self cormas warn: 'No entity selected'].
	x := (self perform: aSymbol) selectionIndex.
	(self perform: aSymbol) list remove: (self perform: aSymbol) selection.
	(self perform: aSymbol)
		selectionIndex: (x min: (self perform: aSymbol) list size)