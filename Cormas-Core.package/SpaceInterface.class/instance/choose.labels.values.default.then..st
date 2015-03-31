user message
choose: messageString labels: labels values: values default: defaultValue then: aBlock
	"request the user to choose from a list of options then evaluate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	| answer |
	answer := Dialog choose: messageString labels: labels values: values
		default: defaultValue.
	aBlock value: answer