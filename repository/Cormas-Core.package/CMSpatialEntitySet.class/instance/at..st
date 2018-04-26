+ accessing
at: index
	"Purpose: answers the value of an indexable component in the receiver
Argument: index = <Integer>
Return value: <SpatialEntity>"
	
	^self components asOrderedCollection at: index