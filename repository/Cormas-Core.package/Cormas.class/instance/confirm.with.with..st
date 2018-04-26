user messages
confirm: aString with: firstParameter with: secondParameter
	
	^Dialog
		confirm: (aString expandMacrosWith: firstParameter with: secondParameter)