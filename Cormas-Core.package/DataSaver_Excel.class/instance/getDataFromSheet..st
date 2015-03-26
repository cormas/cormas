+ read
getDataFromSheet: aString
	"Returns a collection of data from the Excel sheet (aString)"
	
	^(self excelDictionary at: self filename tail asSymbol) getDataFromSheet:
			aString