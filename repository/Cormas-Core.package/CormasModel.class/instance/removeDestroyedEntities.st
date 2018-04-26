referencing entities
removeDestroyedEntities
	"removes all the dead or destroyed intances"
	
	self class allEntityClasses do: [:aClass | self removeDestroyedEntities: aClass]