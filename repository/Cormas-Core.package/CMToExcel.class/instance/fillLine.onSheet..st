write
fillLine: anOrderedCollection onSheet: sheetNum
	"Fill a line in the Excel Application. The ordered collection 
	contains the values"
	
	| sheet |
	sheet := self sheets at: sheetNum.	"Get the right worksheet in the workbook."
	sheet fillFirstLineWith: anOrderedCollection