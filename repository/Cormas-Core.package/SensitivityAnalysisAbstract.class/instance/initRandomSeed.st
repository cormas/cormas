simulation
initRandomSeed
	
	self isRandomSeedFixed value
		ifTrue: [Cormas randomSeed: self randomSeed value]
		ifFalse: [Cormas initRandomSeed]