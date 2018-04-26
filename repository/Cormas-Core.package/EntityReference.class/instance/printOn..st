printing
printOn: aStream
	
	self class printOn: aStream.
	aStream nextPut: $(.
	self entityClass printOn: aStream.
	aStream space.
	self entityId printOn: aStream.
	aStream nextPut: $)