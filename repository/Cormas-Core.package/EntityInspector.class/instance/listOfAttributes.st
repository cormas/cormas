methods
listOfAttributes
	
	| collec |
	self linkedSI siConfig
		ifNil:
			[collec := SortedCollection new.
			self entityClass superClassesInSameEnvironmentUntilEntity
				do: [:c | collec addAll: c instVarNames].
			collec := collec asOrderedCollection.
			self entityClass isAgentCommClass
				ifTrue:
					[collec addFirst: 'mailBox'.
					collec addFirst: 'acquaintances'].
			self entityClass isCellularAutomatonClass
				ifTrue: [collec addFirst: 'state'].
			self entityClass isSituatedClass ifTrue: [collec addFirst: 'patch'].
			self entityClass isArcClass ifTrue: [collec addFirst: 'stopNode'].
			self entityClass isArcClass ifTrue: [collec addFirst: 'startNode'].
			self entityClass isNodeClass ifTrue: [collec addFirst: 'arcs'].
			^collec]
		ifNotNil: [:siConfig | ^siConfig attributesFor: self entityClass]