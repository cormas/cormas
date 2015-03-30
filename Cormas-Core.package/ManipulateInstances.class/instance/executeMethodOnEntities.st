actions
executeMethodOnEntities
	"the selected entites will perform the controlMethod"
	
	| arg collec |
	(self entityClass isNil not
		and:
			[controlMethod value isNil not
				and:
					[(self entityClass findSelector: controlMethod value asSymbol) isNil not]])
		ifFalse: [^nil].	"store before manipulation"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"Which entites?"
	self selectedEntities isEmpty
		ifTrue: [collec := self entitiesCollection]
		ifFalse: [collec := self selectedEntities].	"The entities perform the controlMethod"
	(controlMethod value includes: $:)
		ifFalse: [collec do: [:e | e perform: controlMethod value asSymbol]]
		ifTrue:
			[arg := Cormas askUserArgumentsForMethod: controlMethod value.
			arg ifNil: [^nil].
			collec
				do:
					[:e | 
					e
						perform: controlMethod value asSymbol
						withArguments: arg]].	"Update the situated number"
	nbExistingEntities value: self entitiesCollection size.
	self isSituatedEntity
		ifTrue:
			[nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]