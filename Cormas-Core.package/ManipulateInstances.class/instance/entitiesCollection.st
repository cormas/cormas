accessing
entitiesCollection
	
	self entityClass isAbstract
		ifFalse: [^cormasModel theEntities: self entityClass]
		ifTrue: [^cormasModel allTheEntities: self entityClass]