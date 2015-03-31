private - regular cells - instance creation
eastCellHexa: k
	
	k = 0 ifTrue: [^0].
	k < column | ((k - 1) // column + 1) odd
		ifTrue:
			["ligne impaire ou premiere"
			^k]
		ifFalse:
			["ligne paire"
			^self eastCell: k]