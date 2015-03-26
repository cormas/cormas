write
fillLine: anOrderedCollection
	"Run the damage report."
	
	| sheet |
	"Get the right worksheet in the workbook."
	sheet := self controller worksheetAt: self sheetName.	"Copy our data to the new worksheet."
	[self fillLine: anOrderedCollection onSheet: sheet]
		ensure: [sheet release]