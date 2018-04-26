referencing entities
collectAll: aCollectionOfEntities
	"add all the elements of aCollectionOfEntities to the collection called theXXXs (where XXX is equal to the class name)"
	
	aCollectionOfEntities isEmpty ifTrue: [^nil].
	(self theEntities: aCollectionOfEntities first class) addAll:
			aCollectionOfEntities