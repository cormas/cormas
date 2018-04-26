+ control
ask: aClass select: aBlockCondition toDo: aSymbol with: aValueOrArrayOfValues
	"Purpose: To ask the instances of a class that satisfy a condition to execute a method which requires arguments and named by aSymbol which should end by ':'. The entities are ordered according to their id. 
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self ask: Fireman select:[:f | f isOccupied not] toDo: #moveWithinRange: with: 10
Example: self ask: Animal select: [:a | a energy > 10] toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := (aValueOrArrayOfValues isKindOf: Array)
		ifTrue: [aValueOrArrayOfValues]
		ifFalse: [Array with: aValueOrArrayOfValues].
	collecEntities := (self allTheEntitiesOfClassOrCollec: aClass) select:
			aBlockCondition.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			collecEntities do: [:c | c perform: aSymbol withArguments: allArguments]]