+ moving
randomWalkConstrainedBy: aBlock
	"Purpose: moves to aSpatialEntityElement randomly picked among the direct neighbours (relative distance = 1) fulfilling the constraint specified in aBlock. 
If there is no neighbouring cells fulfilling the constraint, the agent does not move.
Argument: aBlock = <BlockClosure>
Example: self randomWalkConstrainedBy: [:c | c noOccupant]"
	
	| destination destinations |
	patch ifNil: [^nil].
	destinations := patch neighbourhood select: [:c | aBlock value: c].
	destinations isEmpty
		ifFalse:
			[destination := Cormas selectRandomlyFrom: destinations.
			self moveTo: destination]