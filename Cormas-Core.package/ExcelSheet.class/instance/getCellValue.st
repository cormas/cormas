charts
getCellValue
	" return the value of the current cell"
	" 'A2'  -> '33'"
	
	^(self sheet getRange: self currentCell) value