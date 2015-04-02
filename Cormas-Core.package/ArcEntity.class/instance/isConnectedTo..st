+ testing
isConnectedTo: anotherArc
	"answers if anotherArc is a component of its network (without taking into account the orientation of the network)"
	
	^self fullNetwork arcs includes: anotherArc