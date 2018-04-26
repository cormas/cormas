init
createExcelConnexion
	"self filename: (self directory construct: 'analysis.xls')."
	
	excel := CMToExcel
		connectToFilename: self excelFilename
		visible: false