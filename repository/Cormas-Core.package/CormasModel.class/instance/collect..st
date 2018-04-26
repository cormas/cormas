referencing entities
collect: anEntity
	"adds anEntity to the collection called theXXXs (where XXX is equal to the class name)"
	
	| collection |
	collection := self theEntities: anEntity class.
	collection cormasHelper isTypeArrayNotChars
		ifTrue:
			[self
				setTheEntity: anEntity class
				with: (OrderedCollection withAll: collection).
			collection := self theEntities: anEntity class].
	collection add: anEntity