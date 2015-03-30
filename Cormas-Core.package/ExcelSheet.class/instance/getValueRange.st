charts
getValueRange
	" return a <ExcelRangeController>"
	" 'A1:C11'  ie."
	
	self lastColumn.
	self lastLine.
	^self sheet getRange: 'A1:' , self currentCell