util
getFileName: nameWithoutExtension forModel: currentModel
	"return a Filename to store the data.
	currentModel : <CormasModel>"
	
	| fileName |
	fileName := (Cormas dataPath: currentModel class name)
		construct: nameWithoutExtension asString , self extension.
	^fileName asFilename