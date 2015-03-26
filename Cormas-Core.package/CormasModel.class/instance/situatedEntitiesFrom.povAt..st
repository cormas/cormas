- pov and info
situatedEntitiesFrom: aClass povAt: povSelector
	"return a collection of povs from all entities inheriting from aClass"
	
	| coll |
	coll := OrderedCollection new.
	(self theEntities: aClass)
		do:
			[:each | each isSituated ifTrue: [coll add: (each povAt: povSelector)]].
	^coll