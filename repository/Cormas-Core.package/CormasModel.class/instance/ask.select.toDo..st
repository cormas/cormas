+ control
ask: aClass select: aBlockCondition toDo: aSymbol
	"Purpose: To ask the instances of a class that satisfy a condition to execute a method named by aSymbol. The entities are ordered according to their id.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self ask: Animal select: [:f | f energy > 10] toDo: #reproduce"
	
	self ask: aClass select: aBlockCondition toDo: aSymbol with: #()