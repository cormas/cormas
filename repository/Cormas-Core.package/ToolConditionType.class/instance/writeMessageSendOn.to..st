compilation
writeMessageSendOn: codeStream to: aString
	
	codeStream nextPutAll: 'onCondition: '.
	codeStream nextPutAll: toolConditionResult printString.
	codeStream
		nextPutAll: ' goto: ';
		nextPutAll: aString