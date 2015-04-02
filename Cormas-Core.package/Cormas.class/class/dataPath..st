+ utilities - files
dataPath: aModelClassName
	"Purpose: Returns a Filename corresponding to the path of the current model 'data' directory.
Argument: aModelClassName = <String>
Example: (Cormas dataPath: #FireModel) construct: 'test.csv' 		"
	
	| modelPath dataPath |
	modelPath := self modelPath: aModelClassName.
	dataPath := modelPath construct: 'data'.
	dataPath asFilename exists ifFalse: [dataPath asFilename makeDirectory].
	^dataPath