- save
saveCollectionWithLabel: aCollection onSheet: sheetName onFile: aFileName
	"Create the column (or a line) containing the label and the values.

	aCollection = ('aString' 3 5 88 90)
	sheetName = <Integer or String>
	aFileName = <String> ex: 'TimeSeries.xls'"
	
	| label |
	label := aCollection first asString.
	aCollection removeFirst.
	(self excelDictionary at: aFileName asSymbol) saveLabel: label and:
			aCollection onSheet: sheetName