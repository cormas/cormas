initialize-release
initialize
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	self listElements selectionIndexHolder onChangeSend: #changedList to: self