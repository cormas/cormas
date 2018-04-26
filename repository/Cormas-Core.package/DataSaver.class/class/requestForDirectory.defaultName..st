util
requestForDirectory: currentModel defaultName: aString
	"request a directory name to store the data.
	return Nil or a Filename
currentModel : <CormasModel>"
	
	| fileName aName |
	aName := (Cormas dataPath: currentModel class name) construct: aString.
	fileName := Dialog requestNewDirectoryName: 'Name a directory' default:
			aName.
	fileName = ''
		ifTrue: [^nil]
		ifFalse: [^fileName asFilename]