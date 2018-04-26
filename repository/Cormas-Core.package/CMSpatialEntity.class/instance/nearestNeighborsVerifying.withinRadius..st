+ environment - sensing - space
nearestNeighborsVerifying: aBlock withinRadius: range
	"Purpose: returns the nearest spatial entities within a given radius and fulfilling a specified constraint.
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsVerifying: [:c | c isClosed not] withinRadius: 7"
	
	| locations n |
	locations := OrderedCollection new.
	n := 1.
	[locations isEmpty and: [n <= range]]
		whileTrue:
			[locations := self recursiveNeighbourhood: n verifying: aBlock.
			n := n + 1].
	locations
		remove: self
		ifAbsent: [].
	^locations