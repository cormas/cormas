actions
cancelDefaultInfo
	
	self infoMethodsList
		setList: self infoMethodsList_WithoutDefaultSign copy
		selecting: Array new.
	self defaultInfo
		at: self observedEntitiesList selection
		put: nil.
	self displayMethodsForObservedEntity