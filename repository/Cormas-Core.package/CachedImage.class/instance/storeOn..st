printing
storeOn: aStream
	"Don't store the retainedMedium"
	
	aStream
		nextPut: $(;
		store: self class;
		nextPutAll: ' on: ('.
	image storeOn: aStream.
	aStream
		nextPutAll: ') rendered: ';
		store: self conversionMessage;
		nextPutAll: ')'