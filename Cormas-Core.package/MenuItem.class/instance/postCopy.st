copying
postCopy
	"Finish doing whatever is required, beyond a shallowCopy, to implement 'copy'. Answer the receiver."
	
	super postCopy.
	adornment := adornment copy.
	^self