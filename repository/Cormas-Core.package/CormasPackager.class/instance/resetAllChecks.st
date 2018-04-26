checking
resetAllChecks
	"reset all checks widgets"
	
	self checks do: [:each | each resetStatus]