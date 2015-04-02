user messages
request: aMessage initialAnswer: initialString then: aBlock
	"request the user then evaluate aBlock with the result
	this is used for compatibility with spatialGrids for distributed cormas
	no return are expected"
	
	| answer |
	answer := Dialog request: aMessage initialAnswer: initialString.
	aBlock value: answer