private
flushCaches
	
	self allGeneralInstancesDo: [:each | each flushCache]