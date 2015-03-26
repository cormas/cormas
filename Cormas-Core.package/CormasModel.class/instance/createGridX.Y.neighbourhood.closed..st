+ instance creation - spatial entities
createGridX: x Y: y neighbourhood: aNumber closed: aBoolean
	"Purpose: Create a spatial grid made of cells
Arguments:  X : number of columns ; Y : number of lines of the grid.
Arguments: aNumber is the neighbourhood type. It must 4, 6 or 8
Arguments: aBoolean : closed or torroidal space.
Example: self createGridX: 20 Y: 20 neighbourhood: 8 closed: true "
	
	| shapeSymbol nbSymbol |
	aNumber = 8
		ifTrue:
			[shapeSymbol := #squared.
			nbSymbol := #eight].
	aNumber = 4
		ifTrue:
			[shapeSymbol := #squared.
			nbSymbol := #four].
	aNumber = 6
		ifTrue:
			[shapeSymbol := #hexagonal.
			nbSymbol := #six].
	self spaceModel
		initializeRegularX: x
		Y: y
		shape: shapeSymbol
		nbNeighbours: nbSymbol
		boundaries:
			(aBoolean
				ifTrue: [#closed]
				ifFalse: [#torroidal])