init
initExcelFile: aName
	"Create an Excel connexion"
	
	| excelFile |
	excelFile := CMToExcel
		connectToFilename: self excelFilename
		visible: false.
	self excelDictionary
		at: aName asSymbol
		put: excelFile.
	^excelFile