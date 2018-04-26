- displaying
setOutline2
	"clp mars 2000 - PB mai 2002"
	"Pour les cells regulieres : outline est une collection de couples 
	de valeurs (id de cellule; 
	collection de directions) 
	Pour les cells irregulieres: outine est une collection de points"
	
	| directions includedNeighCells outlineTempo |
	self outline: Set new.
	self getSkinE
		do:
			[:c | 
			self spaceModel gridCellShape = #irregular
				ifTrue:
					[outlineTempo := c outline copy asSet.
					includedNeighCells := c neighbourhood
						select: [:n | self containsCell: n].
					includedNeighCells do: [:n | outlineTempo := outlineTempo - n outline].
					self outline addAll: outlineTempo]
				ifFalse:
					[directions := Set new.
					directions addAll: c boundaryDirections.
					(c neighbourhood
						select: [:cc | (self elementaryComponents includes: cc) not])
						do: [:on | directions add: (c directionNeighbour: on)].
					self outline
						add:
							(Array
								with: c id
								with: directions)]]