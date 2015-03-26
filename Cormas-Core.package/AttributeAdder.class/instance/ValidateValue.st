defaultParameters
ValidateValue
	
	self dialogValue close.
	self dialogValue cancel value: false.
	self dialogValue accept value: true	"self attributeValue: self defaultValueHolder value"