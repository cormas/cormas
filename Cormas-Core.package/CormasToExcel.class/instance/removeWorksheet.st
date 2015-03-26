obsolete
removeWorksheet
	
	| worksheetsDD worksheetDD sheet r application |
	"worksheetsDD := workbook getMethod: 'Worksheets'.
	worksheetDD := worksheetsDD invokeMethod: 'Add'.
	ExcelWorksheetController currentClass onDispatchDriver: worksheetDD."
	sheet := self controller worksheetAt: 1.
	application := self controller.	"<COMDispatchDriver>"
	worksheetsDD := workbook getMethod: 'Worksheets'.	"<COMDispatchDriver>"
	worksheetDD := worksheetsDD invokeMethod: 'Add'.	"self controller saveActiveWorkbookAs: fileName."	"sheet saveAs: fileName."
	r := sheet invokeMethod: 'Name' with: #('LULU').
	self halt	"This is obsolete    ->"	"ExcelWorksheetController currentClass onDispatchDriver: r."