initialize - release
initializeForModel: aCormasModel named: aString
	" Private - Set up the cormas model for the receiver "

	self initializeNamed: aString.
	self cormasModel: aCormasModel.
	self cormasModelClass: aCormasModel class.