user messages
confirm: aString with: firstParameter with: secondParameter with: thirdParameter
	
	^Dialog
		confirm:
			(aString expandMacrosWith: firstParameter with: secondParameter with:
					thirdParameter)