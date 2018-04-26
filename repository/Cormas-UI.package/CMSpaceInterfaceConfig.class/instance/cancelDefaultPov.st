actions
cancelDefaultPov
	
	self povMethodsList
		setList: self povMethodsList_WithoutDefaultSign copy
		selecting: Array new.
	self defaultPov
		at: self observedEntitiesList selection
		put: nil.
	self displayMethodsForObservedEntity