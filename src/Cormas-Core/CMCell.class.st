"
Instance Variables:
	orderedNeighbourhood	<Array(SpatialEntity)>  the collection of adjacent spatial entities ordered, in case of a regular grid, counterclockwise from the north (squares) or northeast (hexagons) 

"
Class {
	#name : 'CMCell',
	#superclass : 'CMSpatialEntity',
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'testing' }
CMCell class >> isElementary [
	
	^true
]

{ #category : 'testing' }
CMCell class >> isSpatialEntityElementClass [
	
	^true
]

{ #category : 'aspects' }
CMCell class >> lookClass [

	^ CMCellLook
]

{ #category : 'accessing' }
CMCell >> asString [
	" After adding the name and id of this entity, add its coordinates "
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< super asString;
			crtab;		
			<< 'coordinates: ';
			<< self coordinates asString ]
	
]

{ #category : 'accessing' }
CMCell >> columnNumber [
	"Purpose: returns the X coordinate of the cell in a regular spatial grid"
	
	^self id - ((self rowNumber - 1) * self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMCell >> coordinates [
	"Purpose: Returns the coordinates x and y as a Point instance.
	Example: self coordinates dist: (self neighbourNE coordinates)"
	
	spaceModel ifNil: [ ^ nil ].
	
	^ Point
		x: self columnNumber
		y: self rowNumber
]

{ #category : 'environment - sensing - space' }
CMCell >> directionNeighbour: aCell [
	"Return the compass direction in which aCell is my neighbour, such as #NE, or nil when it is not my neighbour"

	<api>
	| index |
	index := neighbourhoodWithNils indexOf: aCell.
	index = 0 ifTrue: [ ^ nil ].
	^ self spaceModel neighbourhoodConfiguration directions at: index
]

{ #category : 'environment - distance' }
CMCell >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	anotherSpatialEntity isSpatialEntitySet
		ifTrue: [^anotherSpatialEntity distanceTo: self].
	^self spaceModel distanceFromCell: self toCell: anotherSpatialEntity
]

{ #category : 'environment - distance' }
CMCell >> distanceTo: anotherCell constraintOnPath: aBlock [ 
"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self distanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"

	^(self wayTo: anotherCell constraint: aBlock) size - 1
]

{ #category : 'environment - distance' }
CMCell >> euclideanDistanceTo: aCell [
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aCell = <SpatialEntityElement>
Return value: <Number>"
	
	^self spaceModel euclideanDistanceFromCell: self toCell: aCell
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourE [

	<api>
	"Return whether I have a neighbour towards E. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #E
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourN [

	<api>
	"Return whether I have a neighbour towards N. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #N
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourNE [

	<api>
	"Return whether I have a neighbour towards NE. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #NE
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourNW [

	<api>
	"Return whether I have a neighbour towards NW. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #NW
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourS [

	<api>
	"Return whether I have a neighbour towards S. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #S
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourSE [

	<api>
	"Return whether I have a neighbour towards SE. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #SE
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourSW [

	<api>
	"Return whether I have a neighbour towards SW. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #SW
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourTowards: aDirection [
	"Return whether I have a neighbour in a compass direction of my grid, such as #N or #SE. Raise an error when my grid has no such direction"

	<api>
	^ (neighbourhoodWithNils at: (self indexOfDirection: aDirection))
		  isNotNil
]

{ #category : 'environment - sensing - space' }
CMCell >> hasNeighbourW [

	<api>
	"Return whether I have a neighbour towards W. See hasNeighbourTowards:"

	^ self hasNeighbourTowards: #W
]

{ #category : 'private' }
CMCell >> indexOfDirection: aDirection [

	^ self spaceModel neighbourhoodConfiguration directions
		  indexOf: aDirection
		  ifAbsent: [
		  self error: 'This grid has no direction ' , aDirection ]
]

{ #category : 'testing' }
CMCell >> isConnectedToCells: setOfCells [

	^ self neighbourhoodAndSelf anySatisfy: [ :c | setOfCells includes: c ]
]

{ #category : 'testing' }
CMCell >> isElementary [
	
	^true
]

{ #category : 'testing' }
CMCell >> isFlatTopTriangle [
	"Answer if this cell is a Flat-Top triangle"

	self spaceModel cardinal = 3 ifFalse: [ ^ false ].
	^ self id odd
		  ifTrue: [ CMSpace3Neighbourhood firstCellIsFlatTopTriangle ]
		  ifFalse: [ CMSpace3Neighbourhood firstCellIsFlatTopTriangle not]
]

{ #category : 'testing' }
CMCell >> isOnGrid [

	<api>
	<returnType: #Boolean description:
	'Whether the cell belongs to a spatial grid'>
	<doc:
	'Answer whether the cell belongs to a spatial grid. This is true for all the cells created with the grid.'>
	<example: 'self isOnGrid'>
	^ spaceModel isNotNil
]

{ #category : 'testing' }
CMCell >> isOnTheEdge [
	"Answer if the cell is on the edge of the grid (false if the grid is torroidal)"

	self spaceModel isClosedEnvironment ifFalse: [ ^ false ]. 
	(self rowNumber = 1 or: [ self rowNumber = self spaceModel numberOfRows ])
		ifTrue: [ ^ true ].
	(self columnNumber = 1 or: [ self columnNumber = self spaceModel numberOfColumns ])
		ifTrue: [ ^ true ].
	^ false
]

{ #category : 'testing' }
CMCell >> isSpatialEntityElement [
	
	^true
]

{ #category : 'environment - sensing - space' }
CMCell >> lineCol [
	"Return an array containing the coordinates Y and X of the Cell"
	
	^Array
		with: self rowNumber
		with: self columnNumber
]

{ #category : 'environment - sensing - space' }
CMCell >> nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock [
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
CMCell >> nearestCellVerifying: aCondition [
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
CMCell >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
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
CMCell >> nearestCellVerifying: aCondition withMaxOf: aMagnitudeName [
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
CMCell >> nearestCellWithMaxOf: aMagnitudeName [
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
CMCell >> nearestCellWithoutAny: aClass [
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
CMCell >> nearestCellsVerifying: aCondition [
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
CMCell >> nearestCellsVerifying: aCondition withMaxOf: aMagnitudeName [
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
CMCell >> nearestCellsWithMaxOf: aMagnitudeName [
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
CMCell >> nearestCellsWithoutAny: aClass [
	"Purpose: returns the nearest cells without any occupant of a given type.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsWithoutAny: #Predator"
	
	^self
		nearestNeighborsVerifying: [:p | (p hasOccupantsOfClass: aClass) not ]
		withinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMCell >> nearestEmptyCell [
	"Return the nearest cell with no occupant of any kind. 

	If none: returns nil.
	If more than one at the minimum radius: random selection"
	
	^ self spaceModel nearestEmptyCellFor: self
]

{ #category : 'environment - sensing - space' }
CMCell >> nearestEmptyCells [
	"Purpose: returns the nearest cell with no occupant of any kind.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>"
	
	^self
		nearestEmptyNeighborsWithinRadius:
			(self spaceModel numberOfRows max: self spaceModel numberOfColumns)
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourE [

	<api>
	"Return my neighbour towards E. See neighbourTowards:"

	^ self neighbourTowards: #E
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourN [

	<api>
	"Return my neighbour towards N. See neighbourTowards:"

	^ self neighbourTowards: #N
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourNE [

	<api>
	"Return my neighbour towards NE. See neighbourTowards:"

	^ self neighbourTowards: #NE
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourNW [

	<api>
	"Return my neighbour towards NW. See neighbourTowards:"

	^ self neighbourTowards: #NW
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourS [

	<api>
	"Return my neighbour towards S. See neighbourTowards:"

	^ self neighbourTowards: #S
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourSE [

	<api>
	"Return my neighbour towards SE. See neighbourTowards:"

	^ self neighbourTowards: #SE
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourSW [

	<api>
	"Return my neighbour towards SW. See neighbourTowards:"

	^ self neighbourTowards: #SW
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourTowards: aDirection [
	"Return my neighbour in a compass direction of my grid, such as #N or #SE. Raise an error when my grid has no such direction, or when I have no neighbour there, at the edge of a closed grid"

	<api>
	^ (neighbourhoodWithNils at: (self indexOfDirection: aDirection))
		  ifNil: [
				  self error:
					  'This cell does not have a neighbour towards ' , aDirection ]
]

{ #category : 'environment - sensing - space' }
CMCell >> neighbourW [

	<api>
	"Return my neighbour towards W. See neighbourTowards:"

	^ self neighbourTowards: #W
]

{ #category : 'accessing' }
CMCell >> rowNumber [
	"Purpose: returns the Y coordinate of the cell in a regular spatial grid"
	
	^(self id / self spaceModel numberOfColumns) ceiling
]

{ #category : 'environment - distance' }
CMCell >> shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock [
	<api>
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
CMCell >> shortestDistanceToCellsVerifying: aCondition [
	<api>
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
CMCell >> wayTo: anotherCell [
	<api>
	<doc: 'Shortest way to anotherCell'>
	
	| shortestDistance path nearestCells shortestDistance2 nextCell dist |
	
	"for irregular cells, the calculations are much longer"
	self spaceModel gridCellShape = #irregular ifFalse: [
		path := self spaceModel wayFromCell: self toCell: anotherCell.
		path first = self ifTrue: [ path removeFirst ].
		^ path ].	
		
	path := OrderedCollection with: anotherCell.	
	
	shortestDistance := self distanceTo: anotherCell.
	shortestDistance <= 1 ifTrue: [ ^ path ].	"First output condition"
	nearestCells := OrderedCollection new.
	shortestDistance2 := shortestDistance.
	
	anotherCell neighbourhood do: [ :neighbourCell | 
		dist := self distanceTo: neighbourCell.
		
		dist < shortestDistance ifTrue: [
			dist < shortestDistance2 ifTrue: [
				nearestCells := OrderedCollection new.
				shortestDistance2 := dist ].
			
			nearestCells add: neighbourCell ] ].
			
	nextCell := self selectRandomlyFrom: nearestCells.
	path addAllFirst: (self wayTo: nextCell).	"Recursivity call"
		
	^ path
]

{ #category : 'environment - sensing - space' }
CMCell >> wayTo: anotherCell constraint: aBlock [
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
