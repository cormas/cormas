accessing
goto: aState
	
	self
		onCondition: #(true false) asOrderedCollection
		goto: aState