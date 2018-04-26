referencing entities
removeDestroyedEntities: aClass
	"removes all the dead or destroyed intances of type: aClass"
	
	| theEntities destroyedEntities |
	theEntities := self theEntities: aClass.
	theEntities isNil
		ifFalse:
			[destroyedEntities := theEntities select: [:a | a destroyed].
			destroyedEntities
				do:
					[:a | 
					a isSituated ifTrue: [a leave].
					theEntities remove: a]]