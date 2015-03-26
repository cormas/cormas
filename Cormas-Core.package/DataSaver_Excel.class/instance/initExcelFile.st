init
initExcelFile
	"Create an Excel connexion and a worksheet for each probe"
	"self createExcelConnexion."
	
	excel := CormasToExcel
		connectToFilename: self excelFilename
		visible: true.
	excel isVisible: true.
	self createSheets