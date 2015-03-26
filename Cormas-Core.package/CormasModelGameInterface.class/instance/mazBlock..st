blocks
mazBlock: aBlockName
	
	| nullValue |
	((self blocks at: aBlockName) at: #inputFields)
		do:
			[:aSpecName | 
			nullValue := self nullValueForSpec: aSpecName.
			(self perform: aSpecName) value: nullValue]