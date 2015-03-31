- displaying
setOutline
	"original setOutline method for SptialEntityNotConnex
	self outline: Set new.
	self components do:[:aComponent | self outline addAll: aComponent outline].
	^self outline"
	"clp mars 2000 : setOutline for SpatialEntityAggregate copied to SptialEntityNotConnex"
	
	| directions |
	"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
	self outline: Set new.
	self getSkinE
		do:
			[:c | 
			directions := Set new.
			directions addAll: c boundaryDirections.
			(c neighbourhood
				select: [:cc | (self elementaryComponents includes: cc) not])
				do: [:on | directions add: (c directionNeighbour: on)].
			self outline
				add:
					(Array
						with: c id
						with: directions)]