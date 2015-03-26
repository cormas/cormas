checking
checkConditions
	"check if all condition are ok.
	reports directly in the interface.
	return true if all is ok.
	Subclasses shouldn't redefine this method"
	
	self resetAllChecks.
	self checks do: [:each | each checkWith: self].
	^self checks allSatisfy: [:each | each status == true]