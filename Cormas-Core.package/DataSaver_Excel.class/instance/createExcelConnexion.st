init
createExcelConnexion
	"self filename: (self directory construct: 'analysis.xls')."
	
	excel := CormasToExcel
		connectToFilename: self excelFilename
		visible: false