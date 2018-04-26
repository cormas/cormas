printing
writeStoreStringOn: codeStream
	
	codeStream
		nextPutAll: ' from: ( ';
		nextPutAll: self model from name;
		nextPutAll: ' new id: ' , self model from id asString , '); to:  (';
		nextPutAll: self model to name;
		nextPutAll: ' new id: ' , self model to id asString , ')'.
	codeStream nextPutAll: '; points: '.
	points storeOn: codeStream.
	infoText isNil
		ifFalse:
			[codeStream
				cr;
				nextPutAll: '	 ; type: ' , infoText string printString].
	codeStream nextPutAll: '; yourself'