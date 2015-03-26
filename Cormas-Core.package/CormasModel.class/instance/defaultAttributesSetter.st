default values
defaultAttributesSetter
	
	^defaultAttributesSetter
		ifNil: [defaultAttributesSetter := DefaultAttributesSetter newOn: self]