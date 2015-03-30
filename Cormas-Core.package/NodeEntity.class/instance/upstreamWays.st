+ network
upstreamWays
	"returns a collection of all the ways from this Node towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of nodes, starting with the receiver node. "
	
	| ways waysWithoutDuplicated |
	ways := self upstreamWays: (OrderedCollection with: OrderedCollection new).
	waysWithoutDuplicated := OrderedCollection new.
	ways
		do:
			[:aWay | 
			(waysWithoutDuplicated contains: [:coll | coll = aWay])
				ifFalse: [waysWithoutDuplicated add: aWay]].
	^waysWithoutDuplicated