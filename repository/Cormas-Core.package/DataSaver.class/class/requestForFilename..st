util
requestForFilename: currentModel
	"request a file name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	^self
		requestForFilename: currentModel
		extension: self extension