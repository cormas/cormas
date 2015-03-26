+ control
ask: aCollecOrClass toDo: aSymbol
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. In case aCollecOrClass is a class, the entities are ordered according to their id. In case aCollecOrClass is a collection of instances, the order of the collection is kept.
Example: self ask: Fireman toDo: #move
Example: self ask: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"
	
	self ask: aCollecOrClass toDo: aSymbol with: #()