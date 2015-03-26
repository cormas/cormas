run
setWorksheet: aNameOrNumber
	"Set a worksheet <aNameOrNumber>"
	
	| sheet |
	sheet := ExcelSheet newWith: (self controller worksheetAt: aNameOrNumber).
	self sheets addFirst: sheet.
	self resetLinePos