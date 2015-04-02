+ network
cyclicWays
	"return a collection of cyclic ways that the Arc belongs to. Each cyclic way is an ordered collection of arcs, starting with the receiver arc.
	An empty collection means that the arc doesn't belong to any cyclic way. But one arc may belong to several cyclic ways"
	
	| cyclicNodesWays cyclicArcWays wayOfArcs outputNodeIndex |
	self isNetworkStartArc ifTrue: [^#()].
	self isNetworkStopArc ifTrue: [^#()].
	cyclicNodesWays := self stopNode cyclicWays.
	cyclicArcWays := OrderedCollection new.
	cyclicNodesWays
		do:
			[:won | 
			wayOfArcs := OrderedCollection new.
			cyclicArcWays add: wayOfArcs.
			1
				to: won size
				do:
					[:i | 
					i = won size
						ifTrue: [outputNodeIndex := 1]
						ifFalse: [outputNodeIndex := i + 1].
					wayOfArcs
						add:
							((won at: i) outgoingArcs
								detect: [:a | (won at: outputNodeIndex) incomingArcs includes: a])].
			wayOfArcs addFirst: wayOfArcs last.
			wayOfArcs removeLast].
	^cyclicArcWays