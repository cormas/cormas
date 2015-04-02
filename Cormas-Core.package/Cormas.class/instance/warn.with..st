user messages
warn: aString with: firstParameter
	"inform the user with aString with substitution for some parameters
	See the comment in the class StringParameterSubstitution
	self basicNew warn: 'Hello <1s>' with: 'world!'
	"
	
	Dialog warn: (aString expandMacrosWith: firstParameter)