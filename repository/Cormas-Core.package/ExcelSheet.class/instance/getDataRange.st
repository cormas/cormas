charts
getDataRange
	" return a <ExcelRangeController> without first line neither first column"
	" 'B2:C6'  ie."
	
	^self sheet
		getRange: 'A1:' , (self lastColumn , self lastLine printString)	"self currentCell"