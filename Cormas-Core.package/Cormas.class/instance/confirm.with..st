user messages
confirm: aString with: firstParameter
	
	^Dialog confirm: (aString expandMacrosWith: firstParameter)