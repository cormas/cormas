tab APIs
isActive
	
	^codeModel state notNil
		and:
			[codeModel selector notNil
				or: [codeModel protocol notNil and: [codeModel isData not]]]