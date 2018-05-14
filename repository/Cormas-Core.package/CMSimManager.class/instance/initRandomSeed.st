simulate
initRandomSeed
	
	self isRandomSeedFixed
		ifTrue: [Cormas randomSeed: self fixedRandomSeedValue]
		ifFalse: [Cormas initRandomSeed]