printing
printOn: aStream
	
	super printOn: aStream.
	aStream
		nextPutAll: ' pov: ';
		print: povName;
		nextPutAll: ' ofEntity: ';
		nextPutAll: entityClass printString