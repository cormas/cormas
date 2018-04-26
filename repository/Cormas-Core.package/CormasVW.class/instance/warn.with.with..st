user messages
warn: aString with: firstParameter with: secondParameter
	"inform the user with aString with substitution for some parameters
	See the comment in the class StringParameterSubstitution
	self basicNew warn: 'Hello <1s><2s>' with: 'world' with: '!'
	"
	
	Dialog
		warn: (aString expandMacrosWith: firstParameter with: secondParameter)