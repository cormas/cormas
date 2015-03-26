save
getTimeSteps
	"return a collection of number corresponding to the time steps, fromStep - toStep.
ex: ('time' 0 1 2 3 4 5 6)"
	
	| coll |
	coll := OrderedCollection new.
	self fromStep value
		to: self toStep value
		do: [:i | coll add: i].
	^coll