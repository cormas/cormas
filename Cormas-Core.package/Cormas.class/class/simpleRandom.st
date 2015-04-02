private_aleat
simpleRandom
	"Return a pseudo-random value according to the Random equation. No seed.
	This method doesn't use the 'random' method of Cormas and so do not change the next value of RandFishmanMoore.
	It is also useful for non-entities, as display processes for example"
	
	simpleRand isNil ifTrue: [simpleRand := FastRandom new].
	^simpleRand next