private
from: anAgent to: anotherOne content: anObject
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self content: anObject