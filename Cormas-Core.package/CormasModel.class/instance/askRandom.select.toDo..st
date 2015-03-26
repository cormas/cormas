+ control
askRandom: aClass select: aBlockCondition toDo: aSymbol
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. The instances are randomly mixed.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self askRandom: Animal with: [:f | f energy > 10] toDo: #reproduce"
	
	self askRandom: aClass select: aBlockCondition toDo: aSymbol with: #()