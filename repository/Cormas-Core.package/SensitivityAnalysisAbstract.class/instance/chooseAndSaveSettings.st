save
chooseAndSaveSettings
	"Save the content of the 'Parameters windows'
exports the class name, the attributes names and the values into a CSV file"
	
	| fileName |
	self checkSettings = self ifFalse: [^nil].
	fileName := Dialog
		requestNewFileName: 'Save as'
		default:
			((Cormas dataPath: self cormasModelClass name) construct:
					'analysisSettings.csv').
	fileName = '' ifTrue: [^nil].
	self saveSettingsOnFile: fileName asFilename