user messages
warn: aString with: firstParameter with: secondParameter with: thirdParameter
	"inform the user with aString with substitution some parameter
	See the comment in the class StringParameterSubstitution
	self basicNew warn: '<1s> <2s><3s>' with: 'Hello' with: 'world' with: '!'
	"
	
	Dialog
		warn:
			(aString expandMacrosWith: firstParameter with: secondParameter with:
					thirdParameter)