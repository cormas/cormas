- environment - sensing - space
directionNeighbour: v
	
	| directions |
	directions := #(#N #S #W #E #NE #NW #SE #SW).
	directions
		do:
			[:i | (self perform: ('neighbour' , i asString) asSymbol) = v ifTrue: [^i]].
	^nil