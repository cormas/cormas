+ utilities - space metrics
nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2
	"Purpose: Return the probability to have aCell having x2 as value for anAttribute in the direct neighbourhood (distance = 1) of aCell which has x1 as value for anAttribute.
Argument: anAttribute is the name of the attribute, ex #state, X1 and x2 being two possible values.
Example: self nearestNeighbourProbaAttribute: #landUse state1: #field state2: #forest"
	
	^self spaceModel nearestNeighbourProbaAttribute: anAttribute state1: x1
		state2: x2