biology
reproduce
	"The forager reproduces asexually, creating an offspring with the same heritable traits as itself (e.g., feeding strategy). At the same time the parent's energy is reduced by the offspring's initial energy (50).  Newborn offspring occupies the nearest free place to its parent. "
	
	| newForager freePlace |
	freePlace := self nearestEmptyLocationWithinRadius: 1.
	freePlace ifNil: [^nil].
	newForager := self newEntity: self class.
	self energy: self energy - newForager energy.
	newForager moveTo: freePlace