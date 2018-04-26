private_aleat
simpleRandomFrom: start to: end
	"Return a random value between 'start' and 'end'.
	This method doesn't use the 'random' method of Cormas and so do not change the next value of RandFishmanMoore.
	It is also useful for non-entities, as display processes for example"
	
	| extent |
	extent := end - start + 1.
	^end min: (Cormas simpleRandom * extent) truncated + start