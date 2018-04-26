model entities
changeAbstract: aClass
	
	(aClass isAbstract
		ifTrue:
			[self
				confirm:
					aClass name asString ,
							' is abstract. It will be changed as concrete class. 
OK?']
		ifFalse:
			[self
				confirm:
					aClass name asString ,
							' is concrete. It will be changed as abstract class. 
OK?']) ifFalse: [^nil].
	aClass isAbstract not
		ifTrue:
			[aClass class
				compile: 'isAbstract \^true' withCRs
				classified: 'testing'
				notifying: nil]
		ifFalse:
			[aClass class
				compile: 'isAbstract \^false' withCRs
				classified: 'testing'
				notifying: nil].
	self cormasModelClass createInstancesAccessorsForClass: aClass