- testing
isConnectedTo: anotherNode
	"answers if anotherNode is a component of its network (without taking into account the orientation of the network)"
	
	^self fullNetwork nodes includes: anotherNode