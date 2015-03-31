instance creation
toolFor: aString
	
	^(self new)
		startState: (States at: aString);
		yourself