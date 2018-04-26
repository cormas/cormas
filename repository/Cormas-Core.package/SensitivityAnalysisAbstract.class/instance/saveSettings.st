save
saveSettings
	"Save the content of the 'Parameters windows'
exports the class name, the attributes names and the values into a CSV file"
	
	self
		saveSettingsOnFile:
			(self dataSaver directory construct: self analysisSettingsFile)