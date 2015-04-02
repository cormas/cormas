instance creation
newFromCell: startCell toCell: endCell
	
	| inst |
	inst := self newAndCollect.
	inst initFromCell: startCell toCell: endCell.
	^inst