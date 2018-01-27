unit tests
assert: aValue equals: expectedValue
	
	aValue = expectedValue
		ifFalse:
			[self
				error:
					('<1p> was not the expected value <2p>' expandMacrosWith: aValue with:
							expectedValue)]