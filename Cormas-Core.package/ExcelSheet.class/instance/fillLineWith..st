save
fillLineWith: anOrderedCollection
	"Copy the values of anOrderedCollection on the current line of Excel sheet then increase the current line."
	
	| names lastCell |
	names := anOrderedCollection asArray.
	lastCell := (ExcelSheet allColumns
		at: (ExcelSheet columnAsNumber: self currentCol) - 1 + names size)
		asString , self currentLine printString.	"lastColumn := ExcelSheet allColumns at: names size.
	range := self currentCol asString  , self currentLine printString , ':' , lastColumn, self currentLine printString."
	sheet
		setRange: self currentCell , ':' , lastCell
		to: names.
	self incrLine.
	self currentCol: 'A'