- initialize-release
initNeighbourhood
	"Purpose: builds and store the neighbourhood of the receiver as the collection of same kind of aggregates whose components include at least one element the receiver surround"
	
	self edge: (self components contains: [:c | c edge]).
	self setSurround.
	neighbourhood := (surround
		collect:
			[:a | 
			a theCSE
				at: self class name
				ifAbsent: [nil]]) asSet.	"To get rid of duplicates, a Set is used..."
	neighbourhood := neighbourhood asOrderedCollection	"...and then made as an OrderedCollection once the job is done..."