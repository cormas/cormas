private - regular cells - instance creation
westCellHexa: k
	
	k = 0 ifTrue: [^0].
	k < column | ((k - 1) // column + 1) odd
		ifTrue:
			["ligne impaire ou premiere"
			^self westCell: k]
		ifFalse:
			["ligne paire"
			^k]