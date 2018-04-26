private - display
findIndexForEntityClass: entityClass id: entityId in: someEntities
	"sent by a remote spaceInterface to identify a specific entity identified by its id and class among a 
	collection of local entities"
	
	^someEntities
		findFirst:
			[:e | 
			e
				ifNil: [false]
				ifNotNil: [e id = entityId and: [e class = entityClass]]]