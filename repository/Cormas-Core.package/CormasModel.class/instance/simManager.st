accessing
simManager
	
	^ simManager
		ifNil: [
			simManager := CMSimManager new 
				cormasModel: self;
				yourself ]