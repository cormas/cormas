private_aleat
simpleRandom
	" Return a pseudo-random value according to the Random equation. No seed.
	It is also useful for non-entities, as display processes for example"
	
	simpleRand isNil 
		ifTrue: [ simpleRand := Random new ].
	^ simpleRand next