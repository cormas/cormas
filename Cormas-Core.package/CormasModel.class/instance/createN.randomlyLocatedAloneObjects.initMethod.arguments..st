deprecated
createN: aNumber randomlyLocatedAloneObjects: aClass initMethod: aSymbol arguments: aCollec
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new objects are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneObjects: Ore initMethod: #initQuantity: arguments: #(50) "
	
	| a freeCell newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[freeCell := self randomFreeCell.
			freeCell isNil
				ifTrue:
					[self cormas warn: 'No free cell. The simulation will stop'.
					self halt].
			a := self newEntity: aClass.
			a isMovedTo: self randomFreeCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities