"
SpatialEntityAggregates are spatial entities composed of other spatial entities (mainly Cells). A SpatialEntityAggregate can be made of connected  or not-connected components.

Instance Variables:
	components  	<Collection>  
	surround <Collection> of surrounded cells
"
Class {
	#name : 'CMSpatialEntityAggregate',
	#superclass : 'CMSpatialEntity',
	#instVars : [
		'components',
		'surround',
		'borders'
	],
	#category : 'Cormas-Core-Entities',
	#package : 'Cormas-Core',
	#tag : 'Entities'
}

{ #category : 'instance creation' }
CMSpatialEntityAggregate class >> newWith: aSetOfSpatialEntities [
	"Return a new instance of SpatialEntityAggregate, made of aSetOfSpatialEntities
aSetOfSpatialEntities = <Collection of SpatialEntities>"

	| theSpaceModel |
	aSetOfSpatialEntities isEmpty ifTrue: [ ^ nil ].
	theSpaceModel := aSetOfSpatialEntities first spaceModel.
	^ theSpaceModel createOneAggregate: self from: aSetOfSpatialEntities
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> addComponent: aSpatialEntity [
	"Purpose: adds a given component and set the new surround.
	Argument: aSpatialEntity = <SpatialEntity>"

	aSpatialEntity aggregates add: self.
	self components add: aSpatialEntity.
	self setSurround
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> addComponents: aCollectionOfSpatialEntities [
	"Purpose: adds aCollectionOfSpatialEntities (components) 
Argument: aCollectionOfSpatialEntities = <Collection(SpatialEntity)>
Example: self addComponents: self surround"

	aCollectionOfSpatialEntities do: [ :c | 	c aggregates add: self.
	self components add: c. ].

	self setSurround
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> componentAt: index [ 
"Purpose: answers the component at index in the receiver
Argument: index = <Integer>
Return value: <SpatialEntity>"

	^self components at: index
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> components [

	^ components
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> components: aColl [

	components := aColl
]

{ #category : 'environment - distance' }
CMSpatialEntityAggregate >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan shortest distance (in cells) between the receiver and aSpatialEntity ie. the number of cells to reach anotherSpatialEntity (aCell or an Aggregate). If both entities are connected (in contact), the distance is 1.
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"

	(self elementaryComponents includes: anotherSpatialEntity) ifTrue: [ ^ 0 ].
	^ (self nearestCellTo: anotherSpatialEntity) distanceTo:
		  anotherSpatialEntity
]

{ #category : 'environment - distance' }
CMSpatialEntityAggregate >> distanceTo: aSpatialEntity constraintOnPath: aBlock [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and aSpatialEntity ie. the number of cells to reach aSpatialEntity (aCell or an Aggregate). If both entities are connected (in contact), the distance is 1.
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Integer>"

	| nearestCell dist d skin |
	(self elementaryComponents includes: aSpatialEntity) ifTrue: [ ^ 0 ].
	skin := self getBorders copy.
	nearestCell := skin first.
	dist := aSpatialEntity
		        distanceTo: nearestCell
		        constraintOnPath: aBlock.
	skin removeFirst.
	skin do: [ :aComponent |
		d := aComponent distanceTo: aSpatialEntity constraintOnPath: aBlock.
		d < dist ifTrue: [
			dist := d.
			nearestCell := aComponent ]].
	^ dist
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> elementaryComponents [
	"Purpose: returns a collection of the elementary cells that compose this aggregate (receiver). 
	Works to collect the cells even when the receiver is an aggregate of aggregates"

	| allComponents |
	self components isEmpty ifTrue: [ ^ #(  ) ].
	^ (self componentAt: 1) isSpatialEntityElement
		  ifTrue: [ self components ]
		  ifFalse: [
			  allComponents := OrderedCollection new.
			  self components do: [ :c |
				  allComponents addAll: c elementaryComponents "recursive method" ].
			  allComponents ]
]

{ #category : 'environment - distance' }
CMSpatialEntityAggregate >> euclideanDistanceTo: anotherSpatialEntity [
	"Purpose: returns the shortest distance (in cell) between the receiver and another spatialEntity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]

Argument: aSpatialEntity = <SpatialEntity>, a Cell or an Aggregate.
Return value: <Number>"

	| nearestCell dist d skin |
	(self components includes: anotherSpatialEntity) ifTrue: [^0].
	skin := self getBorders copy.
	nearestCell := skin first.
	dist := anotherSpatialEntity euclideanDistanceTo: nearestCell.
	skin removeFirst.
	skin
		do:
			[: aComponent | 
			d := aComponent euclideanDistanceTo: anotherSpatialEntity.
			d < dist
				ifTrue:
					[dist := d.
					nearestCell := aComponent]].
	^dist
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> externalSurround [
	"Returns a collection of cells that surround the aggregate, WITHOUT included cells located into the aggregate"
	
	^self surround \ self internalSurrounds
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> getBorders [
	"Returns a sub-collection of elementaryComponents belonging to the 'internal skin' of the aggregate. 
	It contains the epidermis (external cells), but also internal cells at the edge of the holes of the aggregate (endodermis)"

	| cells |
	borders ifNil: [
		cells := self elementaryComponents.
		borders := cells select: [ :c |
			           (c neighbourhood contains: [ :n |
				            (cells includes: n) not ]) or: [
				           c isOnTheEdge ] ] ].
	^ borders
]

{ #category : 'testing' }
CMSpatialEntityAggregate >> includesCell: aCell [
	"Purpose: tests if the receiver belongs to a higher level spatial entity, even if theCSE is nil. 
This method is valid whatever the aggregate level and even if theCSE is nil. It will return 'true' if the receiver is a component of a component of aSpatialEntity
Argument: aSpatialEntity = <SpatialEntityAggregate>
Return value: <Boolean>"

	^ self elementaryComponents includes: aCell
]

{ #category : 'initialization' }
CMSpatialEntityAggregate >> initNeighbourhood [
	"Purpose: builds and store the neighbourhood of the receiver as the collection of same kind of aggregates whose components include at least one element the receiver surround"

	| neighbourhoodCells |
	neighbourhoodCells := (self surround select: [ :a |
		                       a aggregates anySatisfy: [ :ag |
			                       ag class = self class ] ]) asSet. 
	neighbourhoodWithNils := Set new. "To get rid of duplicates, a Set is used..."
	neighbourhoodCells do: [ :c | neighbourhoodWithNils addAll: c aggregates ].
	neighbourhoodWithNils := neighbourhoodWithNils asOrderedCollection "...and then made as an OrderedCollection once the job is done..."
]

{ #category : 'initialization' }
CMSpatialEntityAggregate >> initialize [

	super initialize.
	components := OrderedCollection new.
	surround := OrderedCollection new
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> internalSurrounds [
	"Returns a collection of internal cells that surround the aggregate, ie. only the cells of the surround located INTO the aggregate"

	| linkedCells |
	"we collect lines of connected cells. If only 1 line, so there is no internal surround"
	linkedCells := self class connectedCellsAmong: surround.
	linkedCells size = 1 ifTrue: [ ^ #() ].
	linkedCells removeFirst.
	^ linkedCells
]

{ #category : 'testing' }
CMSpatialEntityAggregate >> intersectWith: otherAggregate [
	"Answer if the receiver shares cells with otherAggregate"

	^ self elementaryComponents
		  detect: [ :c | otherAggregate includesCell: c ]
		  ifFound: [ true ]
		  ifNone: [ false ]
]

{ #category : 'testing' }
CMSpatialEntityAggregate >> isElementary [
	^false
]

{ #category : 'testing' }
CMSpatialEntityAggregate >> isSpatialEntityElement [

	^ false
]

{ #category : 'testing' }
CMSpatialEntityAggregate >> isSpatialEntitySet [
	
	^true
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> mergeWith: otherAggregate [
	"Purpose:  the receiver aggregate merges with otherAggregate. Then otherAggregate is deleted.
(the surround is then reset)
Argument: otherAggregate = <SpatialEntityAggregate>"

	| copy |
	otherAggregate ifNil: [ ^ nil ].
	otherAggregate destroyed ifTrue: [ ^ nil ].
	copy := otherAggregate components.
	otherAggregate release.
	self addComponents: copy
]

{ #category : 'environment - picking - space' }
CMSpatialEntityAggregate >> nearestCellAmong: aListOfCells [
	"Purpose: returns the nearest cell among aListOfCells. Note that euclidean Distance is used for the calculation. 
Argument: aListOfCells = <OrderedCollection or Set>
Return value: <SpatialEntityElement>
Example: self nearestCellAmong: aListOfCells "

	| nearestCell dist d aList |
	aListOfCells isEmpty ifTrue: [ ^ nil ].
	nearestCell := aListOfCells
		               detect: [ :c | self elementaryComponents includes: c ]
		               ifNone: [ nil ].
	nearestCell ifNotNil: [ ^ nearestCell ].
	nearestCell := aListOfCells first.
	dist := self euclideanDistanceTo: nearestCell.
	aList := aListOfCells copy.
	aList removeFirst.
	self getBorders do: [ :aComponent |
		aList do: [ :c |
			d := aComponent euclideanDistanceTo: c.
			d < dist ifTrue: [
				dist := d.
				nearestCell := c ] ] ].
	^ nearestCell
]

{ #category : 'environment - picking - space' }
CMSpatialEntityAggregate >> nearestCellAmong: aListOfCells constraintOnPath: aBlock [
	"Purpose: returns the nearest cell among aListOfCells.
Note that euclidean Distance is used for the calculation. 
Argument: aListOfCells = <OrderedCollection or Set>
Return value: <SpatialEntityElement>
Example: self nearestCellAmong: aListOfCells "
	
	| nearestCell dist d aList |
	aListOfCells isEmpty ifTrue: [^nil].
	nearestCell := aListOfCells detect: [:c | self elementaryComponents includes: c] ifNone: [nil].
	nearestCell ifNotNil: [^nearestCell].
	nearestCell := aListOfCells first.
	dist := self distanceTo: nearestCell constraintOnPath: aBlock.
	aList := aListOfCells copy.
	aList removeFirst.
	self getBorders do:
			[: aComponent | 
			aList do:
					[:c | 
					d := aComponent distanceTo: c constraintOnPath: aBlock.
					d < dist
						ifTrue:
							[dist := d.
							nearestCell := c]]].
	^nearestCell
]

{ #category : 'environment - picking - space' }
CMSpatialEntityAggregate >> nearestCellTo: anotherSpatialEntity [
	"Purpose: returns one of my component which is the nearest to anotherSpatialEntity, ie. the number of cells to reach anotherSpatialEntity (aCell or an Aggregate). If both entities are connected (in contact), the distance is 1.
	This uses the Manhattan distance (in cells) between the receiver and anotherSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Cell>"

	| nearestCell dist d skin |
	(self components includes: anotherSpatialEntity) ifTrue: [
		^ anotherSpatialEntity ].
	skin := self getBorders copy.
	nearestCell := skin first.
	dist := anotherSpatialEntity distanceTo: nearestCell.
	skin removeFirst.
	skin do: [ :aComponent |
		d := aComponent distanceTo: anotherSpatialEntity. "recursivity"
		d < dist ifTrue: [
			dist := d.
			nearestCell := aComponent ] ].
	^ nearestCell
]

{ #category : 'environment - picking - space' }
CMSpatialEntityAggregate >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"


	| collec target minimum d |
	collec := cormasModel cells select: [:c | condition1 value: c].
	collec ifNil: [^nil].
	target := collec first.
	minimum := self spaceModel numberOfRows * self spaceModel numberOfColumns.
	collec do: 
			[:c | 
			self surround do: 
					[:cs | 
					d := cs shortestDistanceToCells: {c} constraintOnPath: condition2.
					d = 0 ifTrue:[^c].
					d < minimum 
						ifTrue: 
							[minimum := d.
							target := c]]].
	^target
]

{ #category : 'initialize - release' }
CMSpatialEntityAggregate >> release [

	components do: [ :c | c aggregates remove: self ifAbsent: [ nil ] ].
	components := nil.
	surround := nil.
	neighbourhoodWithNils := nil.
	super release
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> removeComponent: aSpatialEntity [
	"Purpose: removes a given component and set the new surround.
	Argument: aSpatialEntity = <SpatialEntity>"

	aSpatialEntity aggregates remove: self ifAbsent: [nil].
	self components remove: aSpatialEntity ifAbsent: [nil].
	self setSurround
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> removeComponents: aCollectionOfSpatialEntities [
	"Purpose: removes a collection of component and set the new surround.
	Argument: aCollectionOfSpatialEntities = <Collection(SpatialEntity)>"
aCollectionOfSpatialEntities do: [ :c | c aggregates remove: self ifAbsent: [ nil ].
	self components remove: c ifAbsent: [ nil ].].
	
	self setSurround
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> setSurround [
	"Set (and returns) the 'surround' attribute: a collection of cells that surround the aggregate, including the cells located into the aggregate"

	^	surround := (self class neighborsOf: self elementaryComponents) asOrderedCollection.
]

{ #category : 'environment - distance' }
CMSpatialEntityAggregate >> shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock [
	"Purpose: gets the shortest distance (in cell unit) to a collection of other cells, taking a specified constraint into account.
Arguments: aCollecOfCells = <Collection(SpatialEntityElement)>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCells: self myPlots constraintOnPath: [:aCell | aCell isClosed not]"

	"self nearestCellVerifying: condition1 constraintOnPath: condition2."

	^ self
		  distanceTo:
		  (self nearestCellAmong: aCollecOfCells constraintOnPath: aBlock)
		  constraintOnPath: aBlock 
]

{ #category : 'environment - distance' }
CMSpatialEntityAggregate >> shortestDistanceToCellsVerifying: aCondition [
	"Purpose: gets the shortest distance (in cell unit) to an external cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"

	
	| collec |
	collec := cormasModel cells select: [ :c | aCondition value: c ].
	collec := collec reject: [ :c | self elementaryComponents includes: c ].
	^ self shortestDistanceToCells: collec constraintOnPath: [  ]
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> size [
"Return the number of cells that compose this aggregate"

	^ self elementaryComponents size
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> surround [

	^ surround
]

{ #category : 'accessing' }
CMSpatialEntityAggregate >> surround: aColl [

	surround := aColl
]

{ #category : 'components management' }
CMSpatialEntityAggregate >> updateSurroundWith: newCell without: oldCell [
	"Upadte (and returns) the 'surround' attribute: a collection of cells that surround the aggregate, including the cells located into the aggregate.
	newCell is a new component of this aggregate. oldCell is an old component"

	newCell ifNotNil: [
		surround remove: newCell.
		surround addAll: (newCell neighbourhood select: [ :c |
				 (self elementaryComponents includes: c) not and: [
					 (surround includes: c) not ] ]) ].
	oldCell ifNotNil: [
		surround add: oldCell.
		surround addAll: (oldCell neighbourhood select: [ :c |
				 (self elementaryComponents includes: c) not and: [
					 (surround includes: c) not ] ]) ].
	^ surround
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityAggregate >> wayTo: anotherSpatialEntity [
	"Purpose: returns one of the shortest path to another spatial entity
Argument: anotherSpatialEntity = <SpatialEntity> (can be a cell or an aggregate)
Return value: <Collection(Cell)>
Example: self wayTo: self spaceModel centralLocation"

	| path path2 collOfPaths |
	anotherSpatialEntity isSpatialEntityElement ifTrue: [
		^ self wayToCell: anotherSpatialEntity ].
	(self intersectWith: anotherSpatialEntity) ifTrue: [
		^ OrderedCollection new ].
	path := self surround first wayTo:
		        anotherSpatialEntity surround first.
	collOfPaths := OrderedCollection new.
	self surround do: [ :cell |
		path2 := anotherSpatialEntity wayToCell: cell.
		path2 size < path size ifTrue: [
			collOfPaths := OrderedCollection new.
			path := path2 ].
		path2 size <= path size ifTrue: [ collOfPaths add: path2 ] ].
	^ self selectRandomlyFrom: collOfPaths
]

{ #category : 'environment - sensing - space' }
CMSpatialEntityAggregate >> wayToCell: aCell [
"Purpose: returns one of the shortest paths to aCell
Argument: aCell = <SpatialEntityElement>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation"

	| path path2 collOfPaths |
	(self elementaryComponents includes: aCell) ifTrue:[^OrderedCollection new].
	(self surround includes: aCell) ifTrue:[^OrderedCollection with: aCell].
	path := self surround first wayTo: aCell.
	collOfPaths := OrderedCollection new.
	self surround
		do:
			[:cell | 
			path2 := cell wayTo: aCell.
			path2 size < path size
				ifTrue:
					[collOfPaths := OrderedCollection new.
					path := path2].
			path2 size <= path size ifTrue: [collOfPaths add: path2]].
	^self selectRandomlyFrom: collOfPaths
]
