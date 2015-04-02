user messages
confirm: aString then: aBlock
	"request the user for confirmation then √©valuate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	[(Dialog confirm: aString) ifTrue: [aBlock value]] promise