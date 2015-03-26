util
requestForDirectory: currentModel
	"request a directory name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	^self requestForDirectory: currentModel defaultName: 'newName'