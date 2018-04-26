deprecated
createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol arguments: aCollec
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. The new objects are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedObjects: Ore initMethod: #initQuantity: arguments: #(50) "
	
	| anEntity newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[anEntity := self newEntity: aClass.
			anEntity isMovedTo: self randomCell.
			anEntity perform: aSymbol withArguments: aCollec.
			newEntities add: anEntity].
	^newEntities