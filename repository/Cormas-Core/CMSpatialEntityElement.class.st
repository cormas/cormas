"
Instance Variables:
	orderedNeighbourhood	<Array(SpatialEntity)>  the collection of adjacent spatial entities ordered, in case of a regular grid, counterclockwise from the north (squares) or northeast (hexagons) 

"
Class {
	#name : #CMSpatialEntityElement,
	#superclass : #CMSpatialEntity,
	#instVars : [
		'orderedNeighbourhood',
		'default'
	],
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

{ #category : #'- environment - sensing - space' }
CMSpatialEntityElement >> boundaryDirections [
	"Returns a collection of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"
	
	| collec |
	collec := Set new.
	self spaceModel nbNeighbours = #four
		ifTrue:
			[self neighbourN isNil ifTrue: [collec add: #N].
			self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourS isNil ifTrue: [collec add: #S].
			self neighbourE isNil ifTrue: [collec add: #E]].
	self spaceModel nbNeighbours = #eight
		ifTrue:
			[self neighbourN isNil ifTrue: [collec add: #N].
			self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourS isNil ifTrue: [collec add: #S].
			self neighbourE isNil ifTrue: [collec add: #E].
			self neighbourNE isNil ifTrue: [collec add: #NE].
			self neighbourSE isNil ifTrue: [collec add: #SE].
			self neighbourNW isNil ifTrue: [collec add: #NW].
			self neighbourSW isNil ifTrue: [collec add: #SW]].
	self spaceModel nbNeighbours = #six
		ifTrue:
			[self neighbourW isNil ifTrue: [collec add: #W].
			self neighbourE isNil ifTrue: [collec add: #E].
			self neighbourNE isNil ifTrue: [collec add: #NE].
			self neighbourSE isNil ifTrue: [collec add: #SE].
			self neighbourNW isNil ifTrue: [collec add: #NW].
			self neighbourSW isNil ifTrue: [collec add: #SW]].
	^collec
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntityElement >> coordinates [
	"Purpose: Returns the coordinates x and y as a Point instance.
Example: self coordinates dist: (self neighbourNE coordinates)"
	
	^Point
		x: self numCol
		y: self numLine
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntityElement >> directionNeighbour: v [
	
	| directions |
	directions := #(#N #S #W #E #NE #NW #SE #SW).
	^ directions 
		detect: [ : i | (self perform: ('neighbour' , i asString) asSymbol) = v  ]
		ifNone: [ nil ]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> displayOn: aGC outlinesInstancesOf: aClassName color: aColorName lineWidth: anInteger [

	(self id = self spaceModel elementaryEntities size
		and: [ (self spaceModel spatialEntities includesKey: aClassName)
				and: [ (self spaceModel spatialEntities at: aClassName) isNil not
						and: [ (self spaceModel spatialEntities at: aClassName) isNotEmpty ] ] ])
		ifTrue: [ aGC paint: (Color perform: aColorName).
			aGC lineWidth: anInteger.
			(self spaceModel spatialEntities at: aClassName)
				do: [ :a | 
					a image notNil
						ifTrue: [ a image component asStroker displayOn: aGC ] ] ]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> displaySegment: aDirection [
	
	| readAccessSelector |
	
	readAccessSelector := ('lineSegment' , aDirection) asSymbol.
	(self perform: readAccessSelector) notNil
		ifTrue:
			[(self perform: readAccessSelector)
				displayStrokedOn: self view graphicsContext]
]

{ #category : #'- deprecated' }
CMSpatialEntityElement >> distCell: aSpatialEntityElement [
	"returns a distance in cells, between the sender and aSpatialEntity"
	
	^self spaceModel distanceFromCell: self toCell: aSpatialEntityElement
]

{ #category : #'- environment - sensing - space' }
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

{ #category : #'+ environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	anotherSpatialEntity isSpatialEntitySet
		ifTrue: [^anotherSpatialEntity distanceTo: self].
	^self spaceModel distanceFromCell: self toCell: anotherSpatialEntity
]

{ #category : #'+ environment - distance' }
CMSpatialEntityElement >> distanceTo: anotherCell constraintOnPath: aBlock [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and anotherSpatialEntity, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self distanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"
	
	^(self wayTo: anotherCell constraint: aBlock) size - 1
]

{ #category : #'+ environment - distance' }
CMSpatialEntityElement >> euclideanDistanceTo: aCell [
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aCell = <SpatialEntityElement>
Return value: <Number>"
	
	^self spaceModel euclideanDistanceFromCell: self toCell: aCell
]

{ #category : #'- initialize-release' }
CMSpatialEntityElement >> initNeighbourhood [
	
	self orderedNeighbourhood isNil ifTrue: [^nil].
	self neighbourhood: (self orderedNeighbourhood select: [:a | a notNil])
]

{ #category : #'+ testing' }
CMSpatialEntityElement >> isConnectedToCells: setOfCells [
	"Purpose: answer if the current cell touches at least one of the setOfCells"
	
	self neighbourhoodAndSelf
		do: [:c | (setOfCells includes: c) ifTrue: [^true]].
	^false
]

{ #category : #'- testing' }
CMSpatialEntityElement >> isCrossedByArc: anArc [
	"answer if the cell is crossed by anArc"

	| arcLine |
	self halt.	"does not work anymore. an ESE does not know directly it bounds."
	self flag:#TODO.
			"Il faudrait justement que ca fonctionne !
L idee initiale était d avoir un espace par défaut (non affiché) sur lequel on pourrait plus facilement faire ce genre de calcul"
	arcLine := LineSegment
		from: anArc startCell center
		to: anArc stopCell center.
	^ arcLine outlineIntersects: self bounds
]

{ #category : #'- testing' }
CMSpatialEntityElement >> isElementary [
	
	^true
]

{ #category : #'+ testing' }
CMSpatialEntityElement >> isSpatialEntityElement [
	
	^true
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntityElement >> lineCol [
	"Return an array containing the coordinates Y and X of the Cell"
	
	^Array
		with: self numLine
		with: self numCol
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentE [
	
	^self segments notNil
		ifTrue: [self segments at: 2]
		ifFalse: [nil]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentEf [
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: (im topRight translatedBy: d @ 0)
				to: (im bottomRight translatedBy: d @ d)].
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentEfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentEfh [
	
	| starts ends nE nSE nNE |
	starts := (Array with: self lineSegmentE start) asOrderedCollection.
	ends := (Array with: self lineSegmentE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse:
			[starts add: nE lineSegmentW end.
			ends add: nE lineSegmentW start].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse: [ends add: nSE lineSegmentNE start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse: [starts add: nNE lineSegmentSE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentN [
	
	^(self segments isNil or: [self orderedNeighbourhood size = 6])
		ifTrue: [nil]
		ifFalse: [self segments first]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNE [
	
	^(self segments isNil or: [self orderedNeighbourhood size ~= 6])
		ifTrue: [nil]
		ifFalse: [self segments first]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNEf [
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentNEfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNEfh [
	
	| starts ends nE nNE nNW |
	starts := (Array with: self lineSegmentNE start) asOrderedCollection.
	ends := (Array with: self lineSegmentNE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse: [ends add: nE lineSegmentNW start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse:
			[starts add: nNE lineSegmentSW end.
			ends add: nNE lineSegmentSW start].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse: [starts add: nNW lineSegmentE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNW [
	
	^(self segments isNil or: [self orderedNeighbourhood size ~= 6])
		ifTrue: [nil]
		ifFalse: [self segments last]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNWf [
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentNWfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNWfh [
	
	| starts ends nNE nNW nW |
	starts := (Array with: self lineSegmentNW start) asOrderedCollection.
	ends := (Array with: self lineSegmentNW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse: [starts add: nW lineSegmentE start].
	nNE := self neighbourNE.
	(nNE isNil or: [self numLine - nNE numLine ~= 1])
		ifFalse: [ends add: nNE lineSegmentSW end].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse:
			[starts add: nNW lineSegmentSE end.
			ends add: nNW lineSegmentE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentNf [
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: im topLeft
				to: (im topRight translatedBy: d @ 0)].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentS [
	
	^(self segments isNil or: [self orderedNeighbourhood size = 6])
		ifTrue: [nil]
		ifFalse: [self segments at: 3]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSE [
	
	^(self segments isNil or: [self orderedNeighbourhood size ~= 6])
		ifTrue: [nil]
		ifFalse: [self segments at: 3]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSEf [
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentSEfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSEfh [
	
	| starts ends nSE nSW nE |
	starts := (Array with: self lineSegmentSE start) asOrderedCollection.
	ends := (Array with: self lineSegmentSE end) asOrderedCollection.
	nE := self neighbourE.
	(nE isNil or: [nE numCol - self numCol ~= 1])
		ifFalse: [starts add: nE lineSegmentW start].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse:
			[starts add: nSE lineSegmentNW end.
			ends add: nSE lineSegmentNW start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse: [ends add: nSW lineSegmentNE end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSW [
	
	^(self segments isNil or: [self orderedNeighbourhood size ~= 6])
		ifTrue: [nil]
		ifFalse: [self segments at: 4]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSWf [
	
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentSWfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSWfh [
	
	| starts ends nW nSE nSW |
	starts := (Array with: self lineSegmentSW start) asOrderedCollection.
	ends := (Array with: self lineSegmentSW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse: [ends add: nW lineSegmentE end].
	nSE := self neighbourSE.
	(nSE isNil or: [nSE numLine - self numLine ~= 1])
		ifFalse: [starts add: nSE lineSegmentNW start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse:
			[starts add: nSW lineSegmentNE end.
			ends add: nSW lineSegmentNW end].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentSf [
	
	| im d |
	self spaceModel gridCellShape = #squared
		ifTrue:
			[im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
			d := 0.
			^LineSegment
				from: (im bottomRight translatedBy: d @ d)
				to: (im bottomLeft translatedBy: 0 @ d)].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentW [
	
	self segments isNil ifTrue: [^nil].
	^self orderedNeighbourhood size = 6
		ifTrue: [self segments at: 5]
		ifFalse: [self segments last]
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentWf [
	
	| im d |
	im := self image component translatedBy: self center.	"self spaceModel delimiter ifFalse: [d := 0] ifTrue: [d := 1]."
	d := 0.
	self spaceModel gridCellShape = #squared
		ifTrue:
			[^LineSegment
				from: (im bottomLeft translatedBy: 0 @ d)
				to: im topLeft].
	self spaceModel gridCellShape = #hexagonal ifTrue: [^self lineSegmentWfh].
	^nil
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> lineSegmentWfh [
	
	| starts ends nW nSW nNW |
	starts := (Array with: self lineSegmentW start) asOrderedCollection.
	ends := (Array with: self lineSegmentW end) asOrderedCollection.
	nW := self neighbourW.
	(nW isNil or: [self numCol - nW numCol ~= 1])
		ifFalse:
			[starts add: nW lineSegmentSE start.
			ends add: nW lineSegmentE start].
	nSW := self neighbourSW.
	(nSW isNil or: [nSW numLine - self numLine ~= 1])
		ifFalse: [starts add: nSW lineSegmentNW end].
	nNW := self neighbourNW.
	(nNW isNil or: [self numLine - nNW numLine ~= 1])
		ifFalse: [ends add: nNW lineSegmentSW start].
	^LineSegment
		from:
			(starts
				inject: 0
				into: [:i :each | i + each]) / starts size
		to:
			(ends
				inject: 0
				into: [:i :each | i + each]) / ends size
]

{ #category : #'- environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: aCondition [
	"Purpose: returns the nearest spatial entity verifying a specified condition 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>
Example: self nearestCellVerifying: [:c | c isClosed not]"
	
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[self
				nearestNeighborVerifying: aCondition
				withinRadius: (self spaceModel line max: self spaceModel column)]
		ifFalse:
			[self
				nearestCellVerifying: aCondition
				constraintOnPath: [:aCell | true]]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec minimum d target |
	collec := (self spaceModel spatialEntities at: self class name)
		select: [:c | condition1 value: c].
	collec isEmpty ifTrue: [^nil].
	minimum := self spaceModel line * self spaceModel column.
	collec
		do:
			[:c | 
			c ~= self
				ifTrue:
					[d := self distanceTo: c constraintOnPath: condition2.
					d < minimum
						ifTrue:
							[minimum := d.
							target := c]]].
	^target
]

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestCellWithoutAny: locatedEntityName [
	"Purpose: returns the nearest cell without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Argument: locatedEntityName = <Symbol | Class>
Return value: <SpatialEntityElement | nil>
Example: self nearestCellWithoutAny: #Tree"
	
	| locations |
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self nearestCellsWithoutAny: locatedEntityName.
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse:
			[super nearestCellVerifying: [:p | p noOccupantType: locatedEntityName]]
]

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestCellsWithoutAny: locatedEntityName [
	"Purpose: returns the nearest cells without any occupant of a given type.
Valid only for regular grids (square or hexagonal cells).  
Argument: locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntityElement)>
Example: self nearestCellsWithoutAny: #Predator"
	
	^self
		nearestNeighborsVerifying: [:p | p noOccupantType: locatedEntityName]
		withinRadius: (self spaceModel line max: self spaceModel column)
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestEmptyCell [
	"Purpose: returns the nearest cell with no occupant of any kind. 
If none: returns nil; if more than one at the minimum radius: random selection
Valid only for regular grids (square or hexagonal cells). For polygonal cells, use the generic but slower method #nearestCellVerifying: in super class SpatialEntity 
Return value: <SpatialEntityElement | nil>"
	
	| locations |
	^(self spaceModel gridCellShape = #squared
		or: [self spaceModel gridCellShape = #hexagonal])
		ifTrue:
			[locations := self
				nearestEmptyNeighborsWithinRadius:
					(self spaceModel line max: self spaceModel column).
			locations isEmpty
				ifFalse: [Cormas selectRandomlyFrom: locations]
				ifTrue: [nil]]
		ifFalse: [super nearestCellVerifying: [:p | p noOccupant]]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> nearestEmptyCells [
	"Purpose: returns the nearest cell with no occupant of any kind.
Valid only for regular grids (square or hexagonal cells).  
Return value: <Collection(SpatialEntityElement)>"
	
	^self
		nearestEmptyNeighborsWithinRadius:
			(self spaceModel line max: self spaceModel column)
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourE [
	"Purpose: returns the neighbour to the East
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 4].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 7].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 5].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourN [
	"Purpose: returns the neighbour to the North
Not nil only for square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		| (self spaceModel nbNeighbours = #eight)
		ifTrue: [^self orderedNeighbourhood at: 1].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourNE [
	"Purpose: returns the neighbour to the NorthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 8].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 6].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourNW [
	"Purpose: returns the neighbour to the NorthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 2].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 1].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourS [
	"Purpose: returns the neighbour to the South
Not nil only fore square cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 3].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 5].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourSE [
	"Purpose: returns the neighbour to the SouthEast
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 6].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 4].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourSW [
	"Purpose: returns the neighbour to the SouthWest
Not nil only for square (8 neighbors) and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 4].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 3].
	^nil
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntityElement >> neighbourW [
	"Purpose: returns the neighbour to the West
Not nil only for square and hexagonal cells (regular spatial grid). 
Return value: <SpatialEntityElement | nil>"
	
	self spaceModel nbNeighbours = #four
		ifTrue: [^self orderedNeighbourhood at: 2].
	self spaceModel nbNeighbours = #eight
		ifTrue: [^self orderedNeighbourhood at: 3].
	self spaceModel nbNeighbours = #six
		ifTrue: [^self orderedNeighbourhood at: 2].
	^nil
]

{ #category : #'+ accessing' }
CMSpatialEntityElement >> numCol [
	"Purpose: returns the X coordinate of the cell in a regular spatial grid"
	
	^self id - ((self numLine - 1) * self spaceModel column)
]

{ #category : #'+ accessing' }
CMSpatialEntityElement >> numLine [
	"Purpose: returns the Y coordinate of the cell in a regular spatial grid"
	
	^(self id / self spaceModel column) ceiling
]

{ #category : #'- accessing' }
CMSpatialEntityElement >> orderedNeighbourhood [
	
	orderedNeighbourhood ifNil: [self spaceModel initNeighbourhood].
	^orderedNeighbourhood
]

{ #category : #'- accessing' }
CMSpatialEntityElement >> orderedNeighbourhood: aList [
	
	orderedNeighbourhood := aList
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> outlinePatch [
	
	^self image component translatedBy: self center
]

{ #category : #'- deprecated' }
CMSpatialEntityElement >> relativeDistanceTo: anotherCell constraint: aBlock [
	"DEPRECATED. Should use: distanceTo: anotherCell constraintOnPath: aBlock
Return an integer : the distance (in cell unit) to anotherCell according to constraint  (aBlock)."
	
	^self shortestDistanceTo: anotherCell constraintOnPath: aBlock
]

{ #category : #'- displaying - obsolete' }
CMSpatialEntityElement >> segments [
	
	| segments |
	segments := OrderedCollection new.
	(self image component translatedBy: self center) asPolyline
		edgesDo: [:i :j | segments add: (LineSegment from: i to: j)].
	^segments
]

{ #category : #'- deprecated' }
CMSpatialEntityElement >> shortestDistanceTo: anotherCell constraintOnPath: aBlock [
	"DEPRECATED. Should use: distanceTo: anotherCell constraintOnPath: aBlock

Purpose: gets the shortest distance (in cell unit) to anotherCell, taking a specified constraint into account.
Arguments: anotherCell = <SpatialEntityElement>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceTo: self spaceModel centralLocation constraintOnPath: [:aCell | aCell isClosed not]"
	
	^(self wayTo: anotherCell constraint: aBlock) size - 1
]

{ #category : #'+ environment - distance' }
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

{ #category : #'+ environment - distance' }
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

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'- deprecated' }
CMSpatialEntityElement >> wayTo: anotherCell constrainedBy: aCondition [
	"DEPRECATED. Should use #wayTo: anotherCell constraint: aCondition
Return an OrderedCollection of cells describing the shortest way to anotherCell according to the constraint aBlock.
path := self wayTo: anotherCell constraint: [:aCell | aCell landCover ~= #ditch].
See example in 'DemoWayTo' model"
	
	^self wayTo: anotherCell constraint: aCondition
]

{ #category : #'+ environment - sensing - space' }
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

{ #category : #'- deprecated' }
CMSpatialEntityElement >> x [
	"This method is not supported because numCol is more explicit. Please use numCol instead."

	"Purpose: returns the X coordinate of the cell in a regular spatial grid"

	self
		deprecated: 'Please use "numCol" instead.'
		transformWith: '`@receiver x' -> '`@receiver numCol'.
	^ self numCol
]

{ #category : #'- deprecated' }
CMSpatialEntityElement >> y [
	"This method is not supported because numCol is more explicit. Please use numCol instead."

	"Purpose: returns the Y coordinate of the cell in a regular spatial grid"

	self
		deprecated: 'Please use "numLine" instead.'
		transformWith: '`@receiver y' -> '`@receiver numLine'.
	^ self numLine
]
