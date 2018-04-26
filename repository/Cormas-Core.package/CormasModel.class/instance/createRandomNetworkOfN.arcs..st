+ instance creation - nodes & arcs
createRandomNetworkOfN: n arcs: anArcClass
	"create a random Network of n arcs (instances of anArcClass) randomly located on the grid. N is a value > 2"
	
	| coll |
	coll := OrderedCollection new.
	n timesRepeat: [coll add: self randomCell].
	^self createNetworkOfArcs: anArcClass onCells: coll