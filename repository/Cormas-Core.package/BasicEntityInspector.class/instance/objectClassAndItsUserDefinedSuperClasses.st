access classes
objectClassAndItsUserDefinedSuperClasses
	"Still used??"
	| collec |
	collec := object class superClassesUntil: CMEntity.
	CormasModel allEntityClasses
		do:
			[:c | 
			collec
				remove: c
				ifAbsent: []].
	collec remove: CMEntity.
	(object isKindOf: CMArcEntity) ifTrue: [collec add: CMArcEntity].
	(object isKindOf: CMNodeEntity) ifTrue: [collec add: CMNodeEntity].
	^collec