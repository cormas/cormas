user messages
warn: aString withAll: someParameters
	"inform the user with aString with substitution some parameter
	See the comment in the class StringParameterSubstitution
	self basicNew warn: '<1s> <2s> <3s><n><t>count: <4p>' withAll: #('Hello' 'world' '!' 1 )
	"
	
	Dialog warn: (aString expandMacrosWithArguments: someParameters)