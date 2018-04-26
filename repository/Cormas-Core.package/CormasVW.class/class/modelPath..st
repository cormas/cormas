+ utilities - files
modelPath: aModelClassName
	"Purpose: Returns a Filename corresponding to the path of the current model directory.
Argument: aModelClassName = <String>
Example: (Cormas modelPath: #FireModel) construct: 'test.csv' 	"
	
	| modelPath |
	modelPath := self modelsPath / aModelClassName asString.
	modelPath exists ifFalse: [modelPath createDirectory].
	^modelPath