Trait {
	#name : 'TCMLocated',
	#instVars : [
		'cell',
		'positionInCell'
	],
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'testing' }
TCMLocated classSide >> isLocated [

	^ true
]

{ #category : 'accessing' }
TCMLocated >> cell [

	^ cell
]

{ #category : 'accessing' }
TCMLocated >> cell: anObject [

	cell := anObject
]

{ #category : 'displaying' }
TCMLocated >> center [

	^ cell ifNil: [ nil ] ifNotNil: [ cell center ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> colocatedEntities: locatedEntityName [
	"Purpose: returns all entities (except the sender) of a given type located in the same location as the receiver. (all locatedEntityName subclasses are considered).
	Return value: <Collection(AgentLocation | ObjectLocation)>
	Example: self colocatedEntities: #Predator 
	"
	
	| occupants |
	self cell ifNil: [ ^ nil ].
	occupants := self cell occupantsOfClassNamed: locatedEntityName.
	(occupants includes: self) 
		ifTrue: [ occupants remove: self ].
	^ occupants
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> colocatedEntities: locatedEntityName verifying: aBlock [
	"Purpose: returns all entities of a given type located in the same location as the receiver and verifying a specified condition.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self colocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ (self colocatedEntities: locatedEntityName) select: [:a | aBlock value: a] ]
]

{ #category : 'environment - picking - agents' }
TCMLocated >> colocatedEntity: locatedEntityName [
	"Purpose: picks RANDOMLY one among the co-located entities of a given type. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
	
	^ self selectRandomlyFrom: candidates
]

{ #category : 'environment - picking - agents' }
TCMLocated >> colocatedEntity: locatedEntityName verifying: aCondition [
	"Purpose: picks RANDOMLY one among the co-located entities of a given type verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey verifying: [:a | a isWeak]"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName verifying: aCondition.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
	
	^ self selectRandomlyFrom: candidates
]

{ #category : 'environment - picking - agents' }
TCMLocated >> colocatedSimilarAgent [
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities. 
If none: returns nil; if more than one: random selection
Return value: <AgentLocation | nil>"
	
	| candidates |
	candidates := self colocatedSimilarAgents.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
	
	^ self selectRandomlyFrom: candidates
]

{ #category : 'environment - picking - agents' }
TCMLocated >> colocatedSimilarAgentVerifying: aCondition [
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | nil>
Example: self colocatedSimilarAgentVerifying: [:a | a sex ~= self sex]"
	
	| candidates |
	candidates := self colocatedSimilarAgentsVerifying: aCondition.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
	
	^ self selectRandomlyFrom: candidates
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> colocatedSimilarAgents [
	"Purpose: returns all receiver-like entities located in the same location as the receiver.
Return value: <Collection(AgentLocation)>"
	
	^ self colocatedEntities: self class name
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> colocatedSimilarAgentsVerifying: aBlock [
	"Purpose: returns all receiver-like entities located in the same location as the receiver and verifying a specified condition.
Argument: aBlock = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self colocatedSimilarAgentsVerifying: [:a | a sex ~= self sex] "
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self colocatedSimilarAgents select: [ :a | aBlock value: a ] ]
]

{ #category : 'displaying' }
TCMLocated >> coordinates [
	" Answer a <Point> with the receiver's coordinates "
	
	self isSituated ifFalse: [ 
		self error: 'The entity must be placed on a cell in order to have coordinates' ].
	
	^ self cell coordinates
]

{ #category : 'star control' }
TCMLocated >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self leave.
	super delete
]

{ #category : 'environment - distance' }
TCMLocated >> distanceTo: aSpatialEntityOrSituatedEntity [
	"Purpose: returns the Manhattan distance (in cells) between the cell of the agent and aSpatialEntityOrSituatedEntity
If it is the distance to a situatedEntity, returrns the distance to the cell of this entity.
Argument: aSpatialEntityOrSituatedEntity = <SpatialEntity> or <AgentLocation> or <ObjectLocation>
Return value: <Integer>"
	
	self isSituated ifFalse: [^nil].
	aSpatialEntityOrSituatedEntity isSituated
		ifTrue: [^self cell distanceTo: aSpatialEntityOrSituatedEntity cell].
	aSpatialEntityOrSituatedEntity isSpatialEntity
		ifTrue: [^self cell distanceTo: aSpatialEntityOrSituatedEntity]
]

{ #category : 'printing' }
TCMLocated >> interestingDetails [
	" Answer a <Collection> of interesting receiver's attributes, from a modeler point of view, to display in a popup for example "

	^ super interestingDetails , { 
		'Coordinates ' -> (self coordinates asString)
		}
]

{ #category : 'testing' }
TCMLocated >> isSituated [
"Purpose: tests the location somewhere in the spatial grid"
	^cell notNil
]

{ #category : 'accessing' }
TCMLocated >> labelOfPOV [
	" Answer a <String> displayed to describe the receiver. 
	To be overwritten if needed"

	^ String empty
]

{ #category : 'star moving' }
TCMLocated >> leave [
"Purpose: moves the agent away from the spatial grid (sets his cell attribute to nil): the situated agent is not located any more, but it is still 'alive'  "
	self leaveWhileMoving: false.
]

{ #category : 'moving' }
TCMLocated >> leaveWhileMoving: isMoving [

	self cell ifNil: [ ^ self ].
	
	isMoving ifFalse: [
		"The situated agent doesn't move; it is not located any more. But it is still 'alive'  "
		self cormasModel spaceModel ifNil: [ ^ self ] ].
			
	(self cell theOccupants at: self class name)
		remove: self
		ifAbsent: [ "do nothing" ].
		
	self cell: nil
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> locatedEntities: locatedEntityName verifying: aBlock withinRadius: range [
	"Purpose: returns all located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			(self locatedEntities: locatedEntityName withinRadius: range)
				select: [ :a | aBlock value: a ] ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> locatedEntities: locatedEntityName withinRadius: range [
	"Purpose: returns all located entities of a given type withing a given radius of the current location (all locatedEntityName subclasses are considered).
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| occupants |
	self cell ifNil: [ ^ nil ].
	
	occupants := (self locationsWithinRadius: range) flatCollect: [ :aCell |
		aCell occupantsOfClassNamed: locatedEntityName ].
	
	(occupants includes: self) ifTrue: [ occupants remove: self ].
	^ occupants
]

{ #category : 'environment - sensing - space' }
TCMLocated >> locationsVerifying: aBlock withinRadius: range [
	"Purpose: returns the spatial entities within a given radius of the receiver current location and verifying the condition specified in aBlock. 
The current location is considered
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell recursiveNeighbourhood: range verifying: aBlock ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> locationsWithinRadius: range [
	"Purpose: returns a collection a cells within a given radius of the current position
The current location is considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^ self cell
		ifNil: [ Array new ]
		ifNotNil: [ self cell recursiveNeighbourhood: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> locationsWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the spatial entities in a given range without any occupant of a given type. 
The current location is considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsWithoutAny: Predator withinRadius: self perceptionRangePredators"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell recursiveNeighbourhood: range withoutAny: locatedEntityName ]
]

{ #category : 'star moving' }
TCMLocated >> moveE [
"Purpose: moves eastward if neighbourE exists (raster grid), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourE notNil])
		ifTrue: [self moveTo: self cell neighbourE]
]

{ #category : 'star moving' }
TCMLocated >> moveN [
"Purpose: moves northward if neighbourN exists (raster grid with square cells), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourN notNil])
		ifTrue: [self moveTo: self cell neighbourN]
]

{ #category : 'star moving' }
TCMLocated >> moveNE [
"Purpose: moves northeastward if neighbourNE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourNE notNil])
		ifTrue: [self moveTo: self cell neighbourNE]
]

{ #category : 'star moving' }
TCMLocated >> moveNW [
"Purpose: moves northwestward if neighbourNW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourNW notNil])
		ifTrue: [self moveTo: self cell neighbourNW]
]

{ #category : 'moving' }
TCMLocated >> moveNcells: n towards: aCell [
	"Purpose: moves n cells in direction of a given location.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 5 towards: self house cell"
	
	| path |
	
	self isSituated ifTrue: [
		self cell = aCell ifFalse: [
			path := self cell wayTo: aCell.
			
			path size < n
				ifTrue: [ self moveTo: aCell ]
				ifFalse: [ self moveTo: (path at: n) ] ] ]
]

{ #category : 'moving' }
TCMLocated >> moveNcells: n towards: aCell constraintOnPath: aBlock [
	"Purpose: moves n cells in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 3 towards: self house cell constraintOnPath: [:c | c isClosed not]"
	
	| path |
	
	self isSituated ifTrue: [
		self cell = aCell ifFalse: [
			path := self cell wayTo: aCell constraint: aBlock.
					
			path size < n
				ifTrue: [ self moveTo: aCell ]
				ifFalse: [ self moveTo: (path at: n) ] ] ]
]

{ #category : 'star moving' }
TCMLocated >> moveS [
"Purpose: moves southward if neighbourS exists (raster grid with square cells), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourS notNil])
		ifTrue: [self moveTo: self cell neighbourS]
]

{ #category : 'star moving' }
TCMLocated >> moveSE [
"Purpose: moves southeastward if neighbourSE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourSE notNil])
		ifTrue: [self moveTo: self cell neighbourSE]
]

{ #category : 'star moving' }
TCMLocated >> moveSW [
"Purpose: moves southwestward if neighbourSW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourSW notNil])
		ifTrue: [self moveTo: self cell neighbourSW]
]

{ #category : 'moving' }
TCMLocated >> moveTo: aCell [
	"Purpose: moves to a given location.
	Example: self moveTo: self cell neighbourN"
	
	aCell isSpatialEntity ifFalse: [ ^ nil ].
	self leaveWhileMoving: true.
	self cell: aCell.
	self cell addOccupant: self.
	
	"We check if the model is nil because we want to make it possible to create cells and agents without a Cormas model. This is used primarily in tests"
	self cormasModel ifNotNil: [
		self positionInCell: (self cormasModel choosePositionForAgent: self inCell: aCell) ]
]

{ #category : 'moving' }
TCMLocated >> moveTowards: aCell [
	"Purpose: moves one cell in direction of a given location.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house cell"
	
	self isSituated ifTrue: [
		self cell = aCell ifFalse: [
			self moveTo: (self cell wayTo: aCell) first ] ]
]

{ #category : 'moving' }
TCMLocated >> moveTowards: aCell constraintOnPath: aBlock [
	"Purpose: moves one cell in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house cell constraintOnPath: [:c | c isClosed not]"

	| path |
	
	self isSituated ifTrue: [
		self cell = aCell ifFalse: [
			path := self cell wayTo: aCell constraint: aBlock.
			
			path size < 2
				ifTrue: [ self error: 'Could not find a valid path' ].
				
			self moveTo: path second ] ]
]

{ #category : 'star moving' }
TCMLocated >> moveW [
"Purpose: moves westward if neighbourW exists (raster grid), do not move otherwise"
	
	(self cell notNil and: [self cell neighbourW notNil])
		ifTrue: [self moveTo: self cell neighbourW]
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestEmptyCell [
	"Return the nearest cell with no occupant of any kind.
	The current cell is NOT considered.
	
	If agent is not located on any cell: signal an error.
	If none: returns nil.
	If more than one at the minimum radius: random selection"
	
	self cell ifNil: [ self error: 'Agent is not located on any cell' ].
	^ self cell nearestEmptyCell
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestEmptyLocationWithinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius of the current location and with no occupant of any kind. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Argument: range = <Integer>
Return value: <SpatialEntity | nil>"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestEmptyNeighborWithinRadius: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestEmptyLocations [
	"Purpose: returns the nearest spatial entities with no occupant of any kind.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestEmptyCells ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestEmptyLocationsWithinRadius: range [
	"Purpose: returns the nearest spatial entities with no occupant of any kind and within a given radius of the current location.
The current location is NOT considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestEmptyNeighborsWithinRadius: range ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> nearestLocatedEntities: locatedEntityName verifying: aBlock withinRadius: range [
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [
			(self nearestLocatedEntities: locatedEntityName withinRadius: range)
				select: [ :entity | aBlock value: entity ] ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> nearestLocatedEntities: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location.
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| entities n |
	self cell ifNil: [ ^ nil ].
	
	entities := OrderedCollection new.
	n := 0.
	
	[ entities isEmpty and: [ n <= range ] ] whileTrue: [
		entities := self locatedEntities: locatedEntityName withinRadius: n.
		n := n + 1 ].
	
	^ entities
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestLocationVerifying: aBlock [
	"Purpose: returns the nearest spatial entity fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not]"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestCellVerifying: aBlock ]
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestLocationVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestNeighborVerifying: aBlock withinRadius: range ]
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestLocationWithoutAny: locatedEntityName [
	"Purpose: returns the nearest spatial entity without any occupant of a given type.
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: locatedEntityName = <Symbol | Class>
Return value: <SpatialEntityElement | nil>
Example: self nearestLocationWithoutAny: #Predator"
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestCellWithoutAny: locatedEntityName ]
]

{ #category : 'environment - picking - space' }
TCMLocated >> nearestLocationWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestNeighborWithoutAny: locatedEntityName withinRadius: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsVerifying: aBlock [
	"Purpose: returns the nearest spatial entities fulfilling the constraint specified in aBlock.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not]"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestCellsVerifying: aBlock ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsVerifying: aCondition withMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude and verifying a specified condition . 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			aCondition = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			self cell
				nearestNeighborsVerifying: aCondition
				withMaxOf: aMagnitudeName
				withinRadius: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestNeighborsVerifying: aBlock withinRadius: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsWithMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsWithoutAny: locatedEntityName [
	"Purpose: returns the nearest spatial entities without any occupant of a given type.
The current location is NOT considered
Arguments: locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntityElement) | nil>
Example: self nearestLocationsWithoutAny: #Predator"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell nearestCellsWithoutAny: locatedEntityName ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> nearestLocationsWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			self cell
				nearestNeighborsWithoutAny: locatedEntityName
				withinRadius: range ]
]

{ #category : 'environment - picking - agents' }
TCMLocated >> nearestSimilarAgentWithingRadius: range [
	"Purpose: picks RANDOMLY one among the nearest receiver-like entities located withing a given radius of the receiver current location.
If none: returns nil; if more than one: random selection
Argument: 	range = <Integer>
Return value: <AgentLocation | nil>
Example: self nearestSimilarAgentWithinRadius: 2"
	
	| candidates |
	candidates := self nearestSimilarAgentsWithinRadius: range.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
	
	^ self selectRandomlyFrom: candidates
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> nearestSimilarAgentsVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self nearestSimilarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^ self
		nearestLocatedEntities: self class name
		verifying: aBlock
		withinRadius: range
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> nearestSimilarAgentsWithinRadius: range [
	"Purpose: returns the nearest receiver-like entities located withing a given radius of the receiver current location.
Argument: 	lrange = <Integer>
Return value: <Collection(AgentLocation) | nil>
Example: self nearestSimilarAgentsWithinRadius: 2"
	
	^ self
		nearestLocatedEntities: self class name
		withinRadius: range
]

{ #category : 'environment - sensing - space' }
TCMLocated >> neighboringLocations [
	"Purpose: return direct neighbours of current location
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell neighbourhood ]
]

{ #category : 'environment - sensing - space' }
TCMLocated >> neighboringLocationsVerifying: aBlock [
	"Purpose: returns direct neighbours of current location fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Argument: aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity) | nil>
Example: self neighboringLocationsVerifying: [:c | c isClosed not]"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self cell neighbourhood select: [ :aCell | aBlock value: aCell ] ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> neighbouringLocatedEntities: locatedEntityName [
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName withinRadius: 1)
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Predator"
	
	self cell ifNil: [ ^ nil ].
	
	^ self cell neighbourhood flatCollect: [ :aCell |
		aCell occupantsOfClassNamed: locatedEntityName ].
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> neighbouringLocatedEntities: locatedEntityName verifying: aCondition [
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName verifying: aCondition withinRadius: 1)
Arguments: 	locatedEntityName = <Symbol | Class>
			aCondition = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			(self neighbouringLocatedEntities: locatedEntityName)
				select: [ :entity | aCondition value: entity ] ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> neighbouringSimilarAgents [
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (#neighbouringSimilarAgents is equivalent to #similarAgentsWithinRadius: 1)
Return value: <Collection(AgentLocation)>"
	
	^ self neighbouringLocatedEntities: self class name
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> neighbouringSimilarAgentsVerifying: aCondition [
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (#neighbouringSimilarAgentsVerifying: aCondition is equivalent to #similarAgentsVerifying: aCondition withinRadius: 1)
Argument: aCondition = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self neighbouringSimilarAgentsVerifying: [:a | a sex ~= self sex]"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [ self neighbouringSimilarAgents select: [ :agent | aCondition value: agent ] ]
]

{ #category : 'accessing' }
TCMLocated >> positionInCell [
	"A Point (u@v) with 0 ≤ u,v ≤ 1 representing relative position inside the cell."
	^ positionInCell ifNil: [ positionInCell := 0.5@0.5 ]
]

{ #category : 'accessing' }
TCMLocated >> positionInCell: aPoint [

	positionInCell := aPoint
]

{ #category : 'printing' }
TCMLocated >> printOn: aStream [

	super printOn: aStream.
	
	self isSituated ifTrue: [
		aStream 
			<< '-coord: ';
			<< self coordinates asString ]
]

{ #category : 'star moving' }
TCMLocated >> randomJump [
"Purpose: moves to a spatial entity randomly picked from the whole grid "

	self moveTo: (self selectRandomlyFrom: self cormasModel cells)
]

{ #category : 'star moving' }
TCMLocated >> randomJumpConstrainedBy: aBlock [

	| destination candidates |
	cell ifNil: [ ^ nil ].
	
	candidates := self cormasModel cells select: [ :aCell | aBlock value: aCell ].
	candidates isEmpty ifTrue: [ ^ self ].
	
	destination := self selectRandomlyFrom: candidates.
	self moveTo: destination
]

{ #category : 'star moving' }
TCMLocated >> randomWalk [
	" Moves to a spatial entity randomly picked from the direct neighbourhood (relative distance = 1) of the current location "

	| destination candidates |
	cell ifNil: [ ^ nil ].
	
	candidates := cell neighbourhood.
	
	candidates ifNil: [ ^ nil ].
	candidates ifEmpty: [ ^ nil ].
		
	destination := self selectRandomlyFrom: candidates.
	self moveTo: destination
]

{ #category : 'moving' }
TCMLocated >> randomWalk: radius [
	"Purpose: moves to aSpatialEntityElement randomly picked among a radius.
Argument: radius = <positive Integer>
Example: self randomWalk: 2 "
	
	self moveTo: (self selectRandomlyFrom: (self cell recursiveNeighbourhood: radius))
]

{ #category : 'moving' }
TCMLocated >> randomWalkConstrainedBy: aBlock [
	" Purpose: moves to aSpatialEntityElement randomly picked among the direct neighbours (relative distance = 1) fulfilling the constraint specified in aBlock.  If there is no neighbouring cells fulfilling the constraint, the agent does not move.
	Argument: aBlock = <BlockClosure>
	Example: self randomWalkConstrainedBy: [:c | c noOccupant] 
	"

	| destination candidates |
	cell ifNil: [ ^ nil ].
	
	candidates := cell neighbourhood select: [ :aCell | aBlock value: aCell ].
	candidates isEmpty ifTrue: [ ^ self ].
	
	destination := self selectRandomlyFrom: candidates.
	self moveTo: destination
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> similarAgentsVerifying: aBlock withinRadius: range [
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			self
				locatedEntities: self class name
				verifying: aBlock
				withinRadius: range ]
]

{ #category : 'environment - sensing - agents' }
TCMLocated >> similarAgentsWithinRadius: range [
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location
Argument: range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsWithinRadius: 3"
	
	^ self cell
		ifNil: [ nil ]
		ifNotNil: [
			self
				locatedEntities: self class name
				withinRadius: range ]
]

{ #category : 'moving' }
TCMLocated >> walkToMaxOf: aSymbol [
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude.
In case several destinations share the same maximum value, the tie is randomly broken.
Argument: aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
Example: self walkToMaxOf: #sugar"
	
	| destination candidates |
	
	candidates := self cell neighbourhood select: [ :aCell |
		(aCell perform: aSymbol) respondsTo: #>].
		
	candidates ifEmpty: [ ^ self ].
		
	candidates := self cell neighbourhood sorted: [ :a :b |
		(a perform: aSymbol) > (b perform: aSymbol)].
	
	candidates := candidates select: [ :aCell |
		(aCell perform: aSymbol) = (candidates first perform: aSymbol) ].
	
	destination := self selectRandomlyFrom: candidates.
	self moveTo: destination
]

{ #category : 'moving' }
TCMLocated >> walkToMaxOf: aSymbol constrainedBy: aBlock [
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude and fulfilling the constraint specified in aBlock.
In case several possible destinations share the same maximum value, the tie is randomly broken.
	Arguments:	aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
			aBlock = <BlockClosure>
	Example: self walkToMaxOf: #sugar constrainedBy: [:c | c noOccupant]
	"

	| destination candidates |
	
	candidates := self cell neighbourhood select: [ :aCell |
		((aCell perform: aSymbol) respondsTo: #>) and: [ aBlock value: aCell ] ].
		
	candidates isEmpty ifTrue: [ ^ self ].
	
	candidates sort: [ :a :b |
		(a perform: aSymbol) > (b perform: aSymbol) ].
	
	candidates := candidates select: [ :aCell |
		(aCell perform: aSymbol) = (candidates first perform: aSymbol) ].
	
	destination := self selectRandomlyFrom: candidates.
	self moveTo: destination
]
