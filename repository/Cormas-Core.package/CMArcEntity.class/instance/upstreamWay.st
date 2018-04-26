+ network
upstreamWay
	"returns the shortest way from this Arc towards the up stream direction (taking into account the orientation of the network).
	The way is an ordered collection of arcs, starting with the receiver arc.
	Be careful, if there are 2 (or more) shortest ways, returns only the first way of the sortedCollection. You may use upstreamWays that returns all the ways then compare them. "
	
	| sortedWays |
	sortedWays := self upstreamWays
		asSortedCollection: [:a :b | a size < b size].
	sortedWays := sortedWays select: [:w | w size = sortedWays first size].
	^sortedWays first