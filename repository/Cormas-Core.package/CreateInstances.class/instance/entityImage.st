aspects
entityImage
	"self entityClass ifNil:[^nil]."
	
	^entityImage
		ifNil:
			[entityImage := EntityPOVView new	" model: (self entityClass defaultImage)"]