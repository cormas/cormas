initialize-release
with: aModel
	"Create a new instance of XMLModel and initialize it with a model and the default path of the xml file"
	
	^self
		with: aModel
		on: (self defaultFilePath: aModel)