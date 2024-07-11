"
Instance Variables:
	orderedNeighbourhood	<Array(SpatialEntity)>  the collection of adjacent spatial entities ordered, in case of a regular grid, counterclockwise from the north (squares) or northeast (hexagons) 

"
Class {
	#name : #CMSpatialEntityElement,
	#superclass : #CMSpatialEntity,
	#category : #'Cormas-Core-Entities'
}

{ #category : #testing }
CMSpatialEntityElement class >> isElementary [
	
	^true
]

{ #category : #testing }
CMSpatialEntityElement class >> isSpatialEntityElementClass [
	
	^true
]

{ #category : #accessing }
CMSpatialEntityElement >> asString [
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			crtab;		
			<< 'coordinates: ';
			<< self coordinates asString ]
	
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> boundaryDirections [
	"Returns a collection of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"
	
	^ self spaceModel setBoundaryDirectionsFor: self.

]

{ #category : #accessing }
CMSpatialEntityElement >> columnNumber [
	"Purpose: returns the X coordinate of the cell in a regular spatial grid"
	
	^self id - ((self rowNumber - 1) * self spaceModel column)
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> coordinates [
	"Purpose: Returns the coordinates x and y as a Point instance.
	Example: self coordinates dist: (self neighbourNE coordinates)"
	
	spaceModel ifNil: [ ^ nil ].
	
	^ Point
		x: self columnNumber
		y: self rowNumber
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> directionNeighbour: v [
	
	| directions |
	directions := #(#N #S #W #E #NE #NW #SE #SW).
	^ directions 
		detect: [ : i | (self perform: ('neighbour' , i asString) asSymbol) = v  ]
		ifNone: [ nil ]
]

{ #category : #'environment - sensing - space' }
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

{ #category : #'environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	anotherSpatialEntity isSpatialEntitySet
		ifTrue: [^anotherSpatialEntity distanceTo: self].
	^self spaceModel distanceFromCell: self toCell: anotherSpatialEntity
]

{ #category : #'environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherCell constraintOnPath: aBlock [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self distanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"
	
	^(self wayTo: anotherCell constraint: aBlock) size - 1
]

{ #category : #'environment - distance' }
CMSpatialEntityElement >> euclideanDistanceTo: aCell [
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aCell = <SpatialEntityElement>
Return value: <Number>"
	
	^self spaceModel euclideanDistanceFromCell: self toCell: aCell
]

{ #category : #'initialize-release' }
CMSpatialEntityElement >> initNeighbourhood [

	"do nothing"
]

{ #category : #testing }
CMSpatialEntityElement >> isConnectedToCells: setOfCells [

	^ self neighbourhoodAndSelf anySatisfy: [ :c | setOfCells includes: c ]
]

{ #category : #testing }
CMSpatialEntityElement >> isCrossedByArc: anArc [
	"answer if the cell is crossed by anArc"
	"does not work anymore. an ESE does not know directly it bounds."

	| arcLine |
			"Il faudrait justement que ca fonctionne !
L idee initiale était d avoir un espace par défaut (non affiché) sur lequel on pourrait plus facilement faire ce genre de calcul"
	arcLine := LineSegment
		from: anArc startCell center
		to: anArc stopCell center.
	^ arcLine outlineIntersects: self bounds
]

{ #category : #testing }
CMSpatialEntityElement >> isElementary [
	
	^true
]

{ #category : #testing }
CMSpatialEntityElement >> isSpatialEntityElement [
	
	^true
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> lineCol [
	"Return an array containing the coordinates Y and X of the Cell"
	
	^Array
		with: self rowNumber
		with: self columnNumber
]

{ #category : #'environment - sensing - space' }
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

{ #category : #'environment - sensing - space' }
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
				withinRadius: (self spaceModel line max: self spaceModel column) ]
		ifFalse: [ self
				nearestCellVerifying: aCondition
				constraintOnPath: [ : aCell | true] ]
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec minimum d target |
	collec := (self spaceModel spatialEntitiesAt: self class name) select: [:c | condition1 value: c].
	collec isEmpty ifTrue: [^nil].
	minimum := self spaceModel line * self spaceModel column.
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

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: aCondition withMaxOf: aMagnitudeName [
	"Purpose: returns the nearest cell verifying a specified condition and with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells).
Arguments: aCondition = <BlockClosure>
			aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellVerifying: [:c | c isPolluted not] withMaxOf: #water"
	
	| locations |
	locations := self nearestCellsVerifying: aCondition withMaxOf:
			aMagnitudeName.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellWithMaxOf: aMagnitudeName [
	"Purpose: returns the nearest cell with the highest value of a specified function. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells).
Argument: aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellWithMaxOf: #sugar"
	
	| locations |
	locations := self nearestCellsWithMaxOf: aMagnitudeName.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellWithoutAny: aClass [
	"Purpose: returns the nearest cell without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Return value: <SpatialEntityElement | nil>
Example: self nearestCellWithoutAny: #Tree"
	
	| locations |
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self nearestCellsWithoutAny: aClass.
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse:
			[super nearestCellVerifying: [ :p | (p hasOccupantsOfClass: aClass) not ]]
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsVerifying: aCondition [
	"Purpose: returns the nearest cells verifying a specified condition.
Valid only for regular grids (square or hexagonal cells). 
Argument: aCondition = <BlockClosure>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsVerifying: [:c | c isClosed not]"
	
	^self
		nearestNeighborsVerifying: aCondition
		withinRadius: (self spaceModel line max: self spaceModel column)
]

{ #category : #'environment - sensing - space' }
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
		withinRadius: (self spaceModel line max: self spaceModel column)
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsWithMaxOf: aMagnitudeName [
	"Purpose: returns the nearest cells with the maximum value of a given magnitude. 
Valid only for regular grids (square or hexagonal cells).  
Argument: aMagnitudeName = <ByteSymbol>
Return value: <SpatialEntityElement>
Example: self nearestNeighborsWithMaxOf: #water"
	
	^self
		nearestNeighborsVerifying: [:c | true]
		withMaxOf: aMagnitudeName
		withinRadius: (self spaceModel line max: self spaceModel column)
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsWithoutAny: aClass [
	"Purpose: returns the nearest cells without any occupant of a given type.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsWithoutAny: #Predator"
	
	^self
		nearestNeighborsVerifying: [:p | (p hasOccupantsOfClass: aClass) not ]
		withinRadius: (self spaceModel line max: self spaceModel column)
]

{ #category : #'environment - sensing - space' }
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

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> nearestEmptyCells [
	"Purpose: returns the nearest cell with no occupant of any kind.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>"
	
	^self
		nearestEmptyNeighborsWithinRadius:
			(self spaceModel line max: self spaceModel column)
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourE [
	"Purpose: returns the neighbour to the East
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ index := 4 ].
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 7 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 5 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the East' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
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

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourNE [
	"Purpose: returns the neighbour to the NorthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-East' ].
	
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 8 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 6 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the North-East' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourNW [
	"Purpose: returns the neighbour to the NorthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the North-West' ].
	
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 2 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 1 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the North-West' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourS [
	"Purpose: returns the neighbour to the South
Not nil only fore square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ index := 3 ].
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 5 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourSE [
	"Purpose: returns the neighbour to the SouthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-East' ].
	
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 6 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 4 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South-East' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourSW [
	"Purpose: returns the neighbour to the SouthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ 
		self error: 'The number of neighbours was set to 4. There is no neighbour to the South-West' ].

	self spaceModel nbNeighbours = 8 ifTrue: [ index := 4 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 3 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the South-West' ].
	^ neighbour
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> neighbourW [
	"Purpose: returns the neighbour to the West
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"

	| index neighbour |
	
	self spaceModel nbNeighbours = 4 ifTrue: [ index := 2 ].
	self spaceModel nbNeighbours = 8 ifTrue: [ index := 3 ].
	self spaceModel nbNeighbours = 6 ifTrue: [ index := 2 ].
	
	neighbour := neighbourhoodWithNils at: index.
	neighbour ifNil: [ self error: 'This cell does not have a neighbour to the West' ].
	^ neighbour
]

{ #category : #accessing }
CMSpatialEntityElement >> rowNumber [
	"Purpose: returns the Y coordinate of the cell in a regular spatial grid"
	
	^(self id / self spaceModel column) ceiling
]

{ #category : #'environment - distance' }
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

{ #category : #'environment - distance' }
CMSpatialEntityElement >> shortestDistanceToCellsVerifying: aCondition [
	"Purpose: gets the shortest distance (Manhattan distance in cell unit) to a cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"

	| targetCell |
	targetCell := self nearestCellVerifying: aCondition.
	^ targetCell isNil
		ifTrue: [ self cormas warn: 'There is no nearest cell' ]
		ifFalse: [ self distanceTo: targetCell ]
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> wayTo: anotherCell [
	"Purpose: gets the shortest way to anotherCell
Argument: anotherCell = <SpatialEntityElement>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation"
	
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
	nextCell := Cormas selectRandomlyFrom: nearestCells.	"nextCell flash."
	path addAllFirst: (self wayTo: nextCell).	"Recursivity call"
	^path
]

{ #category : #'environment - sensing - space' }
CMSpatialEntityElement >> wayTo: anotherCell constraint: aBlock [
	"Purpose: gets the shortest way satisfying a constraint to anotherCell 
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation constraint: [:c | c isClosed not]"
	
	| distance newRound road step alreadyComputed newRound2 |
	self spaceModel elementaryEntities do: [:c | c resetFlag].
	road := OrderedCollection new.
	alreadyComputed := Set new.
	alreadyComputed add: anotherCell.
	distance := 0.
	anotherCell flag: 0.
	newRound := anotherCell neighbourhood select: [:c | aBlock value: c].
	[newRound isEmpty not and: [(newRound includes: self) not]]
		whileTrue:
			[distance := distance + 1.
			newRound do: [:c | c flag: distance].
			alreadyComputed addAll: newRound.
			newRound2 := Set new.
			newRound
				do:
					[:c | 
					newRound2
						addAll:
							(c neighbourhood
								select:
									[:cc | (aBlock value: cc) and: [(alreadyComputed includes: cc) not]])].
			newRound := newRound2].	"S'il y a un chemin possible, on le reconstruit en remontant le gradient, a partir de l'origine"
	(newRound includes: self)
		ifTrue:
			[step := self.
			[step = anotherCell]
				whileFalse:
					[road add: step.
					step := ((step neighbourhood select: [:c | c flag isNil not])
						asSortedCollection: [:p :s | p flag < s flag]) first].
			road add: step].
	^road
]
