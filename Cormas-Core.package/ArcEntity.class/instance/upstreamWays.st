+ network
upstreamWays
	"returns a collection of all the ways from this Arc towards the up stream direction (taking into account the orientation of the network). Each way is an ordered collection of arcs, starting with the receiver arc. "
	
	| nodesWays arcWays wayOfArcs |
	nodesWays := self stopNode upstreamWays.
	arcWays := OrderedCollection new.
	nodesWays
		do:
			[:won | 
			wayOfArcs := OrderedCollection new.
			arcWays add: wayOfArcs.
			1
				to: won size - 1
				do:
					[:i | 
					wayOfArcs
						add:
							((won at: i) incomingArcs
								detect: [:a | (won at: i + 1) outgoingArcs includes: a])]].
	^arcWays