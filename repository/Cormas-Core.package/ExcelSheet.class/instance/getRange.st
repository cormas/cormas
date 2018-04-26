charts
getRange
	" return a <ExcelRangeController>"
	" 'A1:C2'  ie."
	
	^self sheet getRange: 'B1:' , self currentCell