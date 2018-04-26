accessing - entities
allTheEntitiesOfClassOrCollec: aCollecOrClass
	"Purpose:  In case aCollecOrClass is a class or a class name (symbol), the method returns all the entities of the class and subclasses. In case aCollecOrClass is a collection of entities, the method return the same collection
Examples:
self  entitiesFromACollecOrClass: #Farmer
self  entitiesFromACollecOrClass: Farmer
self  entitiesFromACollecOrClass: self theFarmers"
	
	aCollecOrClass isSymbol
		ifTrue: [^self allTheEntities: aCollecOrClass class].
	aCollecOrClass isCollection ifTrue: [^aCollecOrClass].
	aCollecOrClass cormasHelper isTypeEntity
		ifTrue: [^Array with: aCollecOrClass].
	aCollecOrClass cormasHelper isTypeEntityClass
		ifTrue: [^self allTheEntities: aCollecOrClass].
	^nil