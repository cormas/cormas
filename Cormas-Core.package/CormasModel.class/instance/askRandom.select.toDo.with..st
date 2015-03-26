+ control
askRandom: aClass select: aBlockCondition toDo: aSymbol with: aValueOrArrayOfValues
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. The instances are randomly mixed.
Arguments: aBlockCondition is aBlock which use the following syntax [:x | x message ]  wherer x message should return true or false
Example: self askRandom: Fireman with:[:f| f isOccupied not] toDo: #moveWithinRange: with: 10
Example: self askRandom: Animal with: [:a | a energy > 10] toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := (aValueOrArrayOfValues isCollection
		and: [aValueOrArrayOfValues isCharacters not])
		ifTrue: [aValueOrArrayOfValues]
		ifFalse: [Array with: aValueOrArrayOfValues].
	collecEntities := (self allTheEntitiesOfClassOrCollec: aClass) select:
			aBlockCondition.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			(Cormas mixt: collecEntities)
				do: [:c | c perform: aSymbol withArguments: allArguments]]