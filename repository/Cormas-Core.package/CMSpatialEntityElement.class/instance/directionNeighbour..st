- environment - sensing - space
directionNeighbour: v
	
	| directions |
	directions := #(#N #S #W #E #NE #NW #SE #SW).
	^ directions 
		detect: [ : i | (self perform: ('neighbour' , i asString) asSymbol) = v  ]
		ifNone: [ nil ]