access classes
objectClassAndItsUserDefinedSuperClasses
	
	| collec |
	collec := self entityClass superClassesUntil: CMEntity.
	CormasModel allEntityClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: CMEntity.
	^collec