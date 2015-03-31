printing
printOn: aStream
	
	super printOn: aStream.
	aStream
		nextPutAll:
			('(<1p>, <2p>)'
				expandMacrosWith: self symbol
				with: self parameter)