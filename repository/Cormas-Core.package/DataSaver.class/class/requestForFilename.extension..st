util
requestForFilename: currentModel extension: stringExtension
	"request a file name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	| defaultFileName fileName |
	defaultFileName := (Cormas dataPath: currentModel class name)
		construct: currentModel class name asString , stringExtension.
	fileName := Dialog requestNewFileName: 'Save as' default: defaultFileName.
	fileName = ''
		ifTrue: [^nil]
		ifFalse: [^fileName asFilename]