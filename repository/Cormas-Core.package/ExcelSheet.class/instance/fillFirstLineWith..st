save
fillFirstLineWith: anOrderedCollection
	"Copy the values of anOrderedCollection on the fisrt line of Excel sheet then increase the current line."
	
	| names lastColumn range |
	names := anOrderedCollection asArray.
	lastColumn := ExcelSheet allColumns at: names size.
	range := 'A' , self currentLine printString , ':' , lastColumn
		, self currentLine printString.
	sheet setRange: range to: names.
	self incrLine.
	self currentCol: 'A'