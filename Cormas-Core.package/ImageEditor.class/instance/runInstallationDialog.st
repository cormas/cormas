private
runInstallationDialog
	
	self closeRequest.
	self targetSelector: #cachedImage.
	^Array
		with: self targetClass
		with: self targetSelector