+ control
askRandom: aCollecOrClass toDo: aSymbol
	"Purpose: To ask a collection of instances or all the instances of a class to execute a method named by aSymbol. The instances are randomly mixed.
Example: self askRandom: Fireman toDo: #move
Example: self askRandom: (self theAnimals select:[:f | f energy > 10]) toDo: #reproduce"
	
	self askRandom: aCollecOrClass toDo: aSymbol with: #()