navigation
lastColumn
	"return the last column name for which a value exists.
! Only 256 columns in Excel. Last column = 'IV' "
	
	self currentCol: 'A'.
	self currentLine: 1.
	[self getCellValue isNil]
		whileFalse:
			[self incrColumn.
			self currentCol = ExcelSheet ultimateColumn ifTrue: [^self currentCol]].
	self currentCol: self previousColumn.
	^self currentCol