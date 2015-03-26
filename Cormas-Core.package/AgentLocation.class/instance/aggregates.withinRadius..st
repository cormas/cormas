+ environment - sensing - space
aggregates: aClassOrClassName withinRadius: range
	"Purpose: returns an OrderedCollection of ComponentSpatialEntities (aggregate or not connex) located within a given radius of the current position of the agent.
Argument: range = <Integer>
Argument:  aClassOrClassName can be an entity class or the name of an entity <ByteSymbol>
Return value: <OrderedCollection(SpatialEntity) | nil>"
	
	^(self locationsWithinRadius: range) asOrderedCollection
		collect: [:c | c myCSE: aClassOrClassName]