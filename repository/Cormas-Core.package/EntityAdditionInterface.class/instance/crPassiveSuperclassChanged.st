changed
crPassiveSuperclassChanged
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self passiveEntitySuperclass value asString]