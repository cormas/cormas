referencing entities
removeDestroyedEntities
	"removes all the dead or destroyed intances"
	
	self allClasses do: [:aClass | self removeDestroyedEntities: aClass]