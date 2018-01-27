+ moving
randomWalk: radius
	"Purpose: moves to aSpatialEntityElement randomly picked among a radius.
Argument: radius = <positive Integer>
Example: self randomWalk: 2 "
	
	self
		moveTo:
			(Cormas selectRandomlyFrom: (self patch recursiveNeighbourhood: radius))