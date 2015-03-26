procedures
flush
	"flush will transmit the set of messages in the message collection to the receivers."
	
	self messages do: [:a | self transmit: a].
	messages := OrderedCollection new