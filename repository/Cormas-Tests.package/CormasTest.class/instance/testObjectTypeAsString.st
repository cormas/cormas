tests
testObjectTypeAsString
	
	self assert: (Cormas objectTypeAsString: 12) equals: '12'.
	self assert: (Cormas objectTypeAsString: true) equals: 'true'.