+ instance creation - agents & objects
createN: aNumber randomlyLocatedEntities: aClass constrainedBy: aBlock
	"Return a collection of aNumber of entities of aClass for wich the init method 'aSymbol' has been send.
	The new entities are randomly located on the grid on cells that verify the constraint.
	ex: self createN: 10 randomlyLocatedEntities: Predator constrainedBy: [:c | c noOccupant and: [c energy > 1]]"
	
	^self createN: aNumber randomlyLocatedEntities: aClass initMethod: #init
		arguments: #() constrainedBy: aBlock