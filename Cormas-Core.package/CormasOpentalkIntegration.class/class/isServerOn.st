testing
isServerOn
	
	^server isNil not and: [server state = #running]