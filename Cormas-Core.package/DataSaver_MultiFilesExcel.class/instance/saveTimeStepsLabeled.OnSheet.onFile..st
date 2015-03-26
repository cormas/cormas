- save
saveTimeStepsLabeled: aLabel OnSheet: sheetNumber onFile: aFileName
	"Create the first column containing the time values for the probe's sheet.
	sheetNumber = <Integer or String>"
	
	(self excelDictionary at: aFileName asSymbol)
		saveLabel: aLabel
		and: self timeSteps
		onSheet: sheetNumber