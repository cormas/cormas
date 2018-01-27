initialize-release
initialize
	"Initialize a newly created instance. This method must answer the receiver."
	
	self authorMailList list: List new.
	super initialize.
	^self