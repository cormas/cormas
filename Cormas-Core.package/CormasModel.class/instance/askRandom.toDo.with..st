+ control
askRandom: aCollecOrClass toDo: aSymbol with: aValueOrArrayOfValues
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. The instances are randomly mixed.
Example: self askRandom: Fireman toDo: #moveWithinRange: with: 10
Example: self askRandom: Fireman toDo: #moveToCellState:maxDistance: with: #(#onFire 10)
Example: self askRandom: (self theAnimals select:[:f | f energy > 10]) toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := Cormas arrayFrom: aValueOrArrayOfValues.
	collecEntities := self allTheEntitiesOfClassOrCollec: aCollecOrClass.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			(Cormas mixt: collecEntities)
				do: [:c | c perform: aSymbol withArguments: allArguments]]