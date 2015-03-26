+ control
ask: aCollecOrClass toDo: aSymbol with: aValueOrArrayOfValues
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method which requires arguments and named by aSymbol which should end by ':'. In case aCollecOrClass is a class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is kept.
Example: self ask: Fireman toDo: #moveWithinRange: with: 10
Example: self ask: Fireman toDo: #moveToCellState:maxDistance: with: #(#onFire 10)
Example: self ask: (self theAnimals select:[:f | f energy > 10]) toDo: #eatQuantity: with: 5"
	
	| allArguments collecEntities |
	"Check if the argument is a collection or array and rebuilts the list of arguments"
	allArguments := Cormas arrayFrom: aValueOrArrayOfValues.
	collecEntities := self allTheEntitiesOfClassOrCollec: aCollecOrClass.
	collecEntities isEmpty
		ifFalse:
			[self
				checkEntity: collecEntities first
				respondsTo: aSymbol.
			collecEntities do: [:c | c perform: aSymbol withArguments: allArguments]]