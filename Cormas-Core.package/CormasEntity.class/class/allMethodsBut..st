- accessing - methods & classes
allMethodsBut: aProtocolName
	"Return a set of all instance methods of this class and upperclasses which are not in the given protocols aProtocolName.
	aProtocolName = <Symbol or String>"
	
	^self
		allMethodsButProtocols: (OrderedCollection with: aProtocolName asString)