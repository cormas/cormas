access classes
objectClassAndItsUserDefinedSuperClasses
	
	| collec |
	collec := object class superClassesUntil: Entity.
	CormasModelOld allClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: Entity.
	(object isKindOf: ArcEntity) ifTrue: [collec add: ArcEntity].
	(object isKindOf: NodeEntity) ifTrue: [collec add: NodeEntity].
	^collec