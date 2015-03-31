printing
printOn: aStream
	
	super printOn: aStream.
	aStream
		nextPut: $/;
		cr.
	aStream print: toolConditionResult