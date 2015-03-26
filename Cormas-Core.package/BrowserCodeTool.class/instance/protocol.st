accepting
protocol
	
	| protocol definition |
	protocol := super protocol.
	^(protocol isNil and: [(definition := self definition) notNil])
		ifTrue: [definition protocol]
		ifFalse: [protocol]