deprecated
createN: aNumber randomlyLocatedAgents: aClass initMethod: aSymbol arguments: aCollec
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' with a set of arguments 'aCollec' has been send. The new agents are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedAgents: Predator initMethod: #initAge:energy: arguments: #(0 50) "
	
	| anAgent newEntities |
	newEntities := OrderedCollection new.
	aNumber
		timesRepeat:
			[anAgent := self newEntity: aClass.
			anAgent moveTo: self randomCell.
			anAgent perform: aSymbol withArguments: aCollec.
			newEntities add: anAgent].
	^newEntities