actions
inspectSelectedEntities
	"Open an inspector on one entity or a collection of entities"
	
	| collec |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			collec size = 1
				ifTrue: [collec first inspect]
				ifFalse: [collec inspect]]