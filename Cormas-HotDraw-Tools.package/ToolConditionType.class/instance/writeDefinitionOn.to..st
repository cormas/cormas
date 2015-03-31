compilation
writeDefinitionOn: codeStream to: aString
	
	codeStream nextPutAll: '(ConditionTransitionTable new) '.
	self writeMessageSendOn: codeStream to: aString