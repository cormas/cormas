+ instance creation - agents & objects
createN: aNumber randomlyLocatedEntities: aClass
	"Return a collection of aNumber of entities of aClass for wich the 'init' method 'has been send.
	The new entities are randomly located on the grid.
	ex: self createN: 10 randomlyLocatedEntities: Predator"
	
	^self createN: aNumber randomlyLocatedEntities: aClass initMethod: #init