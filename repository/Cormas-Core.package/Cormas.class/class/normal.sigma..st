+ utilities - random
normal: mu sigma: sigma
"Purpose: Return a random number from a normal distribution. polar method, Law et Kelton
Arguments: mu = mean; sigma = standard deviation."

	| w u1 u2 v1 v2 y x1 |
	w := 2.
	[w > 1] whileTrue: 
			[u1 := Cormas random.
			u2 := Cormas random.
			v1 := 2 * u1 - 1.
			v2 := 2 * u2 - 1.
			w := v1 squared + v2 squared].
	y := (-2 * w ln / w) sqrt.
	x1 := v1 * y.
	x1 := mu + (sigma * x1).
	^x1