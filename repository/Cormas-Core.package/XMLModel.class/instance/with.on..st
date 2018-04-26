initialize-release
with: aModel on: aFilePath
	"Initialize an instance with a model and a file path"
	"set the model and the path"
	
	model := aModel.
	filepath := aFilePath asFilename.	"Initialize other variables"
	attributes := List new.
	views := Dictionary new.
	agents := Dictionary new.	"does the file exist?"
	filepath exists
		ifFalse: [self generateSkeletonXMLFile]
		ifTrue:
			[self parseXMLFile.
			self checkWithModel]