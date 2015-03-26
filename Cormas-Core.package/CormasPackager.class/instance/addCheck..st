initialize-release
addCheck: aPackagingCheck
	"add a check to this packager. This method should be used during the initialization phase"
	
	self checks add: aPackagingCheck