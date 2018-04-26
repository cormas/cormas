landscape indices
nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2
	"return the data (a number) to be recorded"
	
	| c1 c2 |
	c1 := self cormasModel theESE select: [:a | (a perform: anAttribute) = x1].
	c2 := c1
		select:
			[:a | a neighbourhood anySatisfy: [:b | (a perform: anAttribute) = x2]].
	^c2 size / c1 size