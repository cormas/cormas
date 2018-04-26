initialize - release
initializeForModel: aCormasModel
	" Private - Set up the cormas model for the receiver "

	self initializeNamed: 'Unnamed'.
	self cormasModel: aCormasModel.
	self cormasModelClass: aCormasModel class.