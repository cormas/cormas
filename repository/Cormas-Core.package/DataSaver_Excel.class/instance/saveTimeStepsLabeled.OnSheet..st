save_private
saveTimeStepsLabeled: aLabel OnSheet: sheetNumber
	"Create the first column containing the time values for the probe's sheet"
	
	self excel
		saveLabel: aLabel
		and: self timeSteps
		onSheet: sheetNumber