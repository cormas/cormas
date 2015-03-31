save
timeSteps
	"return a collection of number corresponding to the time steps.
ex: (0 1 2 3 4 5 6)"
	
	| coll |
	coll := OrderedCollection new.
	0
		to: self finalStep value
		do: [:i | coll add: i].
	^coll