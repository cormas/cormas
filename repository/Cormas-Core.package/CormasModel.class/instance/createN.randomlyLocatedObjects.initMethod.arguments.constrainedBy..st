deprecated
createN: aNumber randomlyLocatedObjects: aClass initMethod: aSymbol arguments: aCollec constrainedBy: aBlock
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send.
	The new objects are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedObjects: Ore initMethod: #initQuantity: arguments: #(50) constrainedBy: [:c |¬†c isLand] "
	
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
			a isMovedTo: targetCell.
			a perform: aSymbol withArguments: aCollec.
			newEntities add: a].
	^newEntities