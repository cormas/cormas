+ instance creation - agents & objects
createN: aNumber randomlyLocatedAloneEntities: aClass initMethod: aSymbol arguments: aCollec
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedAloneEntities: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
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
			a moveTo: freeCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities