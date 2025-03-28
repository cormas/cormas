"
Instance Variables:
	orderedNeighbourhood	<Array(SpatialEntity)>  the collection of adjacent spatial entities ordered, in case of a regular grid, counterclockwise from the north (squares) or northeast (hexagons) 

"
Class {
	#name : 'CMSpatialEntityElement',
	#superclass : 'CMSpatialEntity',
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'testing' }
CMSpatialEntityElement class >> isElementary [
	
	^true
]

{ #category : 'testing' }
CMSpatialEntityElement class >> isSpatialEntityElementClass [
	
	^true
]

{ #category : 'accessing' }
CMSpatialEntityElement >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			crtab;		
			<< 'coordinates: ';
			<< self coordinates asString ]
	
]

{ #category : 'accessing' }
CMSpatialEntityElement >> columnNumber [
	"Purpose: returns the X coordinate of the cell in a regular spatial grid"
	
	^self id - ((self rowNumber - 1) * self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> coordinates [
	"Purpose: Returns the coordinates x and y as a Point instance.
	Example: self coordinates dist: (self neighbourNE coordinates)"
	
	spaceModel ifNil: [ ^ nil ].
	
	^ Point
		x: self columnNumber
		y: self rowNumber
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> directionNeighbour: v [
	
	| directions |
	directions := #(#N #S #W #E #NE #NW #SE #SW).
	^ directions 
		detect: [ : i | (self perform: ('neighbour' , i asString) asSymbol) = v  ]
		ifNone: [ nil ]
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> distanceCell: aSpatialEntityElement [
	"returns a distance in cells, between the sender and aSpatialEntityElement. 
Used for irregular cells, the calculus is much more longer
Be carefull : it's SLOW !! You should rather use 'distanceTo: aSpatialEntity ' "
	
	| n |
	n := 0.
	[(self layerOfRadius: n) includes: aSpatialEntityElement]
		whileFalse: [n := n + 1].
	^n
]

{ #category : 'environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	anotherSpatialEntity isSpatialEntitySet
		ifTrue: [^anotherSpatialEntity distanceTo: self].
	^self spaceModel distanceFromCell: self toCell: anotherSpatialEntity
]

{ #category : 'environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherCell constraintOnPath: aBlock [ 
"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self distanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"

	^(self wayTo: anotherCell constraint: aBlock) size - 1
]

{ #category : 'environment - distance' }
CMSpatialEntityElement >> euclideanDistanceTo: aCell [
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aCell = <SpatialEntityElement>
Return value: <Number>"
	
	^self spaceModel euclideanDistanceFromCell: self toCell: aCell
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourE [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 4 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 7 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 5 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourN [
	
	| index |
	
	index := 1.
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourNE [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-East' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 8 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 6 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourNW [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-West' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 2 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 1 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourS [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 3 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 5 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourSE [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-East' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 6 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 4 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourSW [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-West' ].

	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 4 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 3 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> hasNeighbourW [

	| index |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 2 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 3 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 2 ].
	
	^ (neighbourhoodWithNils at: index) isNotNil
]

{ #category : 'testing' }
CMSpatialEntityElement >> isConnectedToCells: setOfCells [

	^ self neighbourhoodAndSelf anySatisfy: [ :c | setOfCells includes: c ]
]

{ #category : 'testing' }
CMSpatialEntityElement >> isElementary [
	
	^true
]

{ #category : 'testing' }
CMSpatialEntityElement >> isOnTheEdge [
	"Answer if the cell is on the edge of the grid (false if the grid is torroidal)"

	self spaceModel isClosedEnvironment ifFalse: [ ^ false ]. 
	(self rowNumber = 1 or: [ self rowNumber = self spaceModel numberOfRows ])
		ifTrue: [ ^ true ].
	(self columnNumber = 1 or: [ self columnNumber = self spaceModel numberOfColumns ])
		ifTrue: [ ^ true ].
	^ false
]

{ #category : 'testing' }
CMSpatialEntityElement >> isSpatialEntityElement [
	
	^true
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> lineCol [
	"Return an array containing the coordinates Y and X of the Cell"
	
	^Array
		with: self rowNumber
		with: self columnNumber
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock [
	"Return the nearest cell among aCollecOfCells"
	
	| minimum d target |
	minimum := self
		distanceTo: aCollecOfCells first
		constraintOnPath: aBlock.
	aCollecOfCells
		do:
			[:c | 
			d := self distanceTo: c constraintOnPath: aBlock.
			d <= minimum
				ifTrue:
					[minimum := d.
					target := c]].
	^target
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: aCondition [
	"Purpose: returns the nearest spatial entity verifying a specified condition 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>
Example: self nearestCellVerifying: [:c | c isClosed not]"
	
	^(self spaceModel gridCellShape = #squared 	or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue: [ self
				nearestNeighborVerifying: aCondition
				withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns) ]
		ifFalse: [ self
				nearestCellVerifying: aCondition
				constraintOnPath: [ : aCell | true] ]
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec minimum d target |
	collec := cormasModel cells select: [:c | condition1 value: c].
	collec isEmpty ifTrue: [^nil].
	minimum := self spaceModel numberOfRows * self spaceModel numberOfColumns.
	collec do: [ : c | 
			c ~= self
				ifTrue: [
					d := self distanceTo: c constraintOnPath: condition2.
					d < minimum
						ifTrue:
							[minimum := d.
							target := c]]].
	^target
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: aCondition withMaxOf: aMagnitudeName [
	"Returns the nearest cell verifying a specified condition and with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells)."
	
	| locations |
	locations := self nearestCellsVerifying: aCondition withMaxOf:
			aMagnitudeName.
			
	^ locations
		ifNotEmpty: [ self selectRandomlyFrom: locations ]
		ifEmpty: [ nil ]
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellWithMaxOf: aMagnitudeName [
	"Returns the nearest cell with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells)"
	
	| locations |
	locations := self nearestCellsWithMaxOf: aMagnitudeName.
	
	^ locations
		ifNotEmpty: [ self selectRandomlyFrom: locations ]
		ifEmpty: [ nil ]
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellWithoutAny: aClass [
	"Returns the nearest cell without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity"

	| locations |
	^ (#( squared hexagonal ) includes: self spaceModel gridCellShape)
		  ifTrue: [
			  locations := self nearestCellsWithoutAny: aClass.
			  locations
				  ifNotEmpty: [ self selectRandomlyFrom: locations ]
				  ifEmpty: [ nil ] ]
		  ifFalse: [
			  super nearestCellVerifying: [ :p |
				  (p hasOccupantsOfClass: aClass) not ] ] 
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsVerifying: aCondition [
	"Purpose: returns the nearest cells verifying a specified condition.
Valid only for regular grids (square or hexagonal cells). 
Argument: aCondition = <BlockClosure>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsVerifying: [:c | c isClosed not]"
	
	^self
		nearestNeighborsVerifying: aCondition
		withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsVerifying: aCondition withMaxOf: aMagnitudeName [
	"Purpose: returns the nearest cells verifying a specified condition and with the maximum value of a given magnitude. 
Valid only for regular grids (square or hexagonal cells).  
Arguments: aCondition = <BlockClosure>
			aMagnitudeName = <ByteSymbol>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsVerifying: [:c | c isPolluted not] withMaxOf: #water"
	
	^self
		nearestNeighborsVerifying: [:c | true]
		withMaxOf: aMagnitudeName
		withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsWithMaxOf: aMagnitudeName [
	"Purpose: returns the nearest cells with the maximum value of a given magnitude. 
Valid only for regular grids (square or hexagonal cells).  
Argument: aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement>
Example: self nearestNeighborsWithMaxOf: #water"
	
	^self
		nearestNeighborsVerifying: [:c | true]
		withMaxOf: aMagnitudeName
		withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsWithoutAny: aClass [
	"Purpose: returns the nearest cells without any occupant of a given type.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsWithoutAny: #Predator"
	
	^self
		nearestNeighborsVerifying: [:p | (p hasOccupantsOfClass: aClass) not ]
		withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestEmptyCell [
	"Purpose: returns the nearest cell with no occupant of any kind. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Return value: <SpatialEntityElement | nil>"
	
	^ self spaceModel nearestEmptyCellFor: self
"	^(self spaceModel gridCellShape = #squared 	or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self
				nearestEmptyNeighborsWithinRadius:
					(self spaceModel line max: self spaceModel column).
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse: [super nearestCellVerifying: [:p | p noOccupant]]"
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> nearestEmptyCells [
	"Purpose: returns the nearest cell with no occupant of any kind.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>"
	
	^self
		nearestEmptyNeighborsWithinRadius:
			(self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourE [
	"Purpose: returns the neighbour to the East
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 4 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 7 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 5 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the East' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourN [
	"Purpose: returns the neighbour to the North
Not nil only for square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	| index neighbour |
	
	index := 1.
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the North' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourNE [
	"Purpose: returns the neighbour to the NorthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-East' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 8 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 6 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the North-East' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourNW [
	"Purpose: returns the neighbour to the NorthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-West' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 2 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 1 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the North-West' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourS [
	"Purpose: returns the neighbour to the South
Not nil only fore square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 3 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 5 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourSE [
	"Purpose: returns the neighbour to the SouthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-East' ].
	
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 6 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 4 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South-East' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourSW [
	"Purpose: returns the neighbour to the SouthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-West' ].

	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 4 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 3 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South-West' ].
	^ neighbour
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> neighbourW [
	"Purpose: returns the neighbour to the West
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel numberOfNeighbours = 4 ifTrue: [ index := 2 ].
	self spaceModel numberOfNeighbours = 8 ifTrue: [ index := 3 ].
	self spaceModel numberOfNeighbours = 6 ifTrue: [ index := 2 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the West' ].
	^ neighbour
]

{ #category : 'accessing' }
CMSpatialEntityElement >> rowNumber [
	"Purpose: returns the Y coordinate of the cell in a regular spatial grid"
	
	^(self id / self spaceModel numberOfColumns) ceiling
]

{ #category : 'environment - distance' }
CMSpatialEntityElement >> shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock [
	"Purpose: gets the shortest distance (Manhattan distance in cell unit) to a collection of other cells, taking a specified constraint into account.
Arguments: aCollecOfCells = <Collection(SpatialEntityElement)>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCells: self myPlots constraintOnPath: [:aCell | aCell isClosed not]"
	
	^self
		distanceTo:
			(self nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock)
]

{ #category : 'environment - distance' }
CMSpatialEntityElement >> shortestDistanceToCellsVerifying: aCondition [
	"Purpose: gets the shortest distance (Manhattan distance in cell unit) to a cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"

	| targetCell |
	targetCell := self nearestCellVerifying: aCondition.
	^ targetCell
		  ifNil: [ self error: 'There is no nearest cell' ]
		  ifNotNil: [ self distanceTo: targetCell ]
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> wayTo: anotherCell [
	"Shortest way to anotherCell"
	
	| shortestDistance path nearestCells shortestDistance2 nextCell |
	path := OrderedCollection new.
	self spaceModel gridCellShape = #irregular
		ifFalse:
			[path := self spaceModel wayFromCell: self toCell: anotherCell.
			path first = self ifTrue: [path removeFirst].
			^path].	"for irregular cells, the calculus is much more longer"
	path add: anotherCell.
	shortestDistance := self distanceTo: anotherCell.
	shortestDistance <= 1 ifTrue: [^path].	"First output condition"
	nearestCells := OrderedCollection new.
	shortestDistance2 := shortestDistance.
	anotherCell neighbourhood
		do:
			[:neighCell | 
			| dist |
			dist := self distanceTo: neighCell.
			dist < shortestDistance
				ifTrue:
					[dist < shortestDistance2
						ifTrue:
							[nearestCells := OrderedCollection new.
							shortestDistance2 := dist].
					nearestCells add: neighCell]].
	nextCell := self selectRandomlyFrom: nearestCells.	"nextCell flash."
	path addAllFirst: (self wayTo: nextCell).	"Recursivity call"
	^path
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityElement >> wayTo: anotherCell constraint: aBlock [
	"Purpose: gets the shortest way satisfying a constraint to anotherCell"
	
	| cellDistanceDict distance newRound path step alreadyComputed |
	
	cellDistanceDict := Dictionary new.
	
	path := OrderedCollection new.
	alreadyComputed := Set with: anotherCell.
	distance := 0.
	cellDistanceDict at: anotherCell put: 0.
	newRound := anotherCell neighbourhood select: [ :cell | aBlock value: cell ].
	
	"If there is a possible path, we reconstruct it by going up the gradient, starting from the origin"
	[ newRound isNotEmpty and: [ (newRound includes: self) not ] ] whileTrue: [
		distance := distance + 1.
		newRound do: [ :cell | cellDistanceDict at: cell put: distance ].
		alreadyComputed addAll: newRound.
			
		newRound := Set withAll: (newRound flatCollect: [ :cell |
			cell neighbourhood select: [ :neighbour |
				(aBlock value: neighbour) and: [ (alreadyComputed includes: neighbour) not ] ] ]) ].
			
	(newRound includes: self) ifTrue: [
		step := self.
		[ step = anotherCell ] whileFalse: [
			path add: step.
			
			step := (step neighbourhood
				select: [ :cell | cellDistanceDict includesKey: cell ])
				detectMin: [ :cell | cellDistanceDict at: cell ] ].
		
		path add: step ].
		
	^path
]
