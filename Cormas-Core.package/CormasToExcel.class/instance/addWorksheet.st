run
addWorksheet
	
	| worksheetsDD worksheetDD |
	worksheetsDD := workbook getMethod: 'Worksheets'.
	worksheetDD := worksheetsDD invokeMethod: 'Add'.
	ExcelWorksheetController currentClass onDispatchDriver: worksheetDD