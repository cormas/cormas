private
to: anotherOne topic: aSymbol content: anObject
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anotherOne.
	self topic: aSymbol.
	self content: anObject