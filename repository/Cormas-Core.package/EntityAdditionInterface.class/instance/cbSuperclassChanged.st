changed
cbSuperclassChanged
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self getAgentSuperclassFromGUI name asString]