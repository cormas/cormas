operation
displayFiles
	"Display the Excel files"
	
	self excelDictionary values do: [:anExcel | anExcel isVisible: true]