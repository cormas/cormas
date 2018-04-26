referencing entities
removeEntity: anEntity
	"removes the dead or destroyed Entity"
	
	anEntity isSituated ifTrue: [anEntity leave].
	(self theEntities: anEntity class)
		remove: anEntity
		ifAbsent: [nil]