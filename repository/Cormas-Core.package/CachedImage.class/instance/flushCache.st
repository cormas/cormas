private
flushCache
	
	retainedMedium ifNotNil: [retainedMedium close].
	retainedMedium := nil