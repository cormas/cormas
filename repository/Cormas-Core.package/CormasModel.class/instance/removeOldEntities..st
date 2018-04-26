- binary storage
removeOldEntities: aClass
	"Delete the entities of aClass, stored into 'theXXXs' collection.
	entities = <Class>"
	
	| entities |
	entities := self perform: (self getterForEntityClass: aClass).
	entities reverseDo: [:inst | inst delete].
	self removeDestroyedEntities: aClass.
	aClass CurrentId: nil