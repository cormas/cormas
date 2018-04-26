accessing-path
modelPath: aModelClassName
	"Purpose: Returns a Filename corresponding to the path of the current model directory.
	Argument: aModelClassName = <String>
	Example: 
	(Cormas modelPath: #FireModel) construct: 'test.csv' 
	"
	
	^ (self modelsPath / aModelClassName asString) ensureCreateDirectory.
