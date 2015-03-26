write
nextCellPut: aValue onSheet: aSheetNum
	"Fill a cell in the Excel Application."
	
	| sheet |
	"Get the right worksheet in the workbook."
	sheet := self sheets at: aSheetNum.
	sheet saveValue: aValue