blocks
nullValueForSpec: aSpecName
	
	^(self perform: aSpecName) value cormasHelper nullValue ifNil: [self halt]