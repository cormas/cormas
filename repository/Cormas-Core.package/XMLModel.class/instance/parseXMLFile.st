private
parseXMLFile
	"Parse the XML file (at filepath) and check the result concords with the model"
	
	| parser |
	parser := XMLParser on: filepath.
	parser saxDriver: self.	"parser validate: false."
	parser scanDocument.	"Reset variables"
	currentView := nil