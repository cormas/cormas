simulate
initRandomSeed
	
	self fixRandomSeed value
		ifTrue: [Cormas randomSeed: self randomSeed value]
		ifFalse: [Cormas initRandomSeed]