+ update
updateEntities
	"Purpose: removes all the dead or destroyed intances from all theXXXs collections and adds the new entities stored into collector"
	
	self collector entities
		keysAndValuesDo:
			[:class :collec | (self theEntities: class) addAll: collec].
	self collector empty.	"removes all the dead or destroyed intances"
	self removeDestroyedEntities