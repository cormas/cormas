init
initExcelFile
	"Create an Excel connexion with a worksheet for each probe"
	
	excel := CormasToExcel
		connectToFilename: self excelFilename
		visible: true.
	excel isVisible: true.
	self createSheets