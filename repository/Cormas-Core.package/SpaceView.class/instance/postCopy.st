copying
postCopy
	"Do not copy the dependents list."
	
	super postCopy.
	selections := OrderedCollection new