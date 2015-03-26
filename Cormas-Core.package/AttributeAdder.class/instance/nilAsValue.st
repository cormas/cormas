defaultParameters
nilAsValue
	
	self dialogValue close.
	self dialogValue cancel value: true.
	self dialogValue accept value: false.
	self defaultValueHolder value: nil