+ instance creation - agents & objects
createN: aNumber randomlyLocatedEntities: aClass initMethod: aSymbol arguments: aCollec constrainedBy: aBlock
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new entities are randomly located on the free cells of the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator initMethod: #initAge constrainedBy: [:cell | cell energy > 1] "
	
	| a targetCell newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[targetCell := self pickCellConstrainedBy: aBlock.
			targetCell isNil
				ifTrue:
					[self cormas warn:
							'No available cell for the constraint. The simulation will stop'.
					self halt].
			a := self newEntity: aClass.
			a moveTo: targetCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities