+ network
downstreamWay
	"Purpose: returns the shortest way from this element towards the down stream direction (taking into account the orientation of the network).
The way is an ordered collection of elements, starting with the receiver node.
Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use downstreamWays that returns all the ways then compare them. "
	
	self subclassResponsibility