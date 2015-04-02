user messages
confirm: aString withAll: someParameters
	
	^Dialog confirm: (aString expandMacrosWithArguments: someParameters)