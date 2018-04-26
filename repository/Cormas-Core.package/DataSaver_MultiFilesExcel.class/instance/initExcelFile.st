init
initExcelFile
	"Create an Excel connexion with a worksheet for each probe"
	
	excel := CMToExcel
		connectToFilename: self excelFilename
		visible: true.
	excel isVisible: true.
	self createSheets