model entities
createModelAccessors: newClass
	"ask if newClass is Abstract, 
	no, then creates the attribut 'theNewClasss' and the accesors at the level of cormasModel,
	yes, then creates an accessing methods 'theNewClasss' that will returns a collection of all entities of newClass and its subclasses"
	
	| isAbstract |
	(newClass inheritsFrom: SpatialEntityElement)
		ifTrue: [isAbstract := false]
		ifFalse: [isAbstract := self confirm_IsAbstractClass: newClass].
	isAbstract
		ifTrue:
			[newClass class
				compile: 'isAbstract \^true' withCRs
				classified: 'testing'
				notifying: nil]
		ifFalse:
			[newClass class
				compile: 'isAbstract \^false' withCRs
				classified: 'testing'
				notifying: nil].
	self cormasModelClass createInstancesAccessorsForClass: newClass