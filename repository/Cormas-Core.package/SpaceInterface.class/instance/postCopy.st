copying
postCopy
	"Do not copy the dependents list."
	
	super postCopy.
	self breakDependents.
	drawing := self drawing copy