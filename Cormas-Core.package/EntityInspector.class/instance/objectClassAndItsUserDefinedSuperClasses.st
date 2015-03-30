access classes
objectClassAndItsUserDefinedSuperClasses
	
	| collec |
	collec := self entityClass superClassesUntil: Entity.
	CormasModel allClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: Entity.
	^collec