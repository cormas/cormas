"
Please note the following possible problems:
	In the description of ordre, type is not a class name.

Please note the following possible problems:
	The value of the class instance variable ordre is nil, which does not match the declared types >.

Instance Variables:
	patch	<SpatialEntity>  the location of the agent as a reference to a spatial entity. Symetrically, the spatial entity records the agents located there in its ""theOccupants"" attribute, a dictionary of collections of located entities.

Class Instance Variables:
	ordre	<type>  comment

"
Class {
	#name : #CMAgentLocation,
	#superclass : #CMAgent,
	#instVars : [
		'patch'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #testing }
CMAgentLocation class >> isSituatedClass [
	
	^true
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> aggregates: aClassOrClassName withinRadius: range [
	"Purpose: returns an OrderedCollection of ComponentSpatialEntities (aggregate or not connex) located within a given radius of the current position of the agent.
Argument: range = <Integer>
Argument:  aClassOrClassName can be an entity class or the name of an entity <ByteSymbol>
Return value: <OrderedCollection(SpatialEntity) | nil>"
	
	^(self locationsWithinRadius: range) asOrderedCollection
		collect: [:c | c myCSE: aClassOrClassName]
]

{ #category : #displaying }
CMAgentLocation >> center [
	
	^ patch isNil
		ifTrue: [ nil ]
		ifFalse: [ patch center ]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> colocatedEntities: locatedEntityName [
	"Purpose: returns all entities (except the sender) of a given type located in the same location as the receiver. (all locatedEntityName subclasses are considered).
	Argument: 	locatedEntityName = <Symbol | Class>
	Return value: <Collection(AgentLocation | ObjectLocation)>
	Example: self colocatedEntities: #Predator 
	"
	
	| collec |
	self patch ifNil: [ ^ nil ].
	collec := self patch occupantsAt: locatedEntityName.
	(collec includes: self) 
		ifTrue: [ collec remove: self ].
	^ collec
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> colocatedEntities: locatedEntityName verifying: aBlock [
	"Purpose: returns all entities of a given type located in the same location as the receiver and verifying a specified condition.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self colocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self colocatedEntities: locatedEntityName) select: [:a | aBlock value: a]]
]

{ #category : #'environment - picking - agents' }
CMAgentLocation >> colocatedEntity: locatedEntityName [
	"Purpose: picks RANDOMLY one among the co-located entities of a given type. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName.
	^ (candidates isNil or: [ candidates isEmpty ])
		ifTrue: [ nil ]
		ifFalse: [ Cormas selectRandomlyFrom: candidates ]
]

{ #category : #'environment - picking - agents' }
CMAgentLocation >> colocatedEntity: locatedEntityName verifying: aCondition [
	"Purpose: picks RANDOMLY one among the co-located entities of a given type verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | ObjectLocation | nil>
Example: self colocatedEntity: #Prey verifying: [:a | a isWeak]"
	
	| candidates |
	candidates := self colocatedEntities: locatedEntityName verifying:
			aCondition.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]
]

{ #category : #'environment - picking - agents' }
CMAgentLocation >> colocatedSimilarAgent [
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities. 
If none: returns nil; if more than one: random selection
Return value: <AgentLocation | nil>"
	
	| candidates |
	candidates := self colocatedSimilarAgents.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]
]

{ #category : #'environment - picking - agents' }
CMAgentLocation >> colocatedSimilarAgentVerifying: aCondition [
	"Purpose: picks RANDOMLY one among the co-located receiver-like entities verifying a specified condition. 
If none: returns nil; if more than one: random selection
Argument: aCondition = <BlockClosure>
Return value: <AgentLocation | nil>
Example: self colocatedSimilarAgentVerifying: [:a | a sex ~= self sex]"
	
	| candidates |
	candidates := self colocatedSimilarAgentsVerifying: aCondition.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> colocatedSimilarAgents [
	"Purpose: returns all receiver-like entities located in the same location as the receiver.
Return value: <Collection(AgentLocation)>"
	
	^self colocatedEntities: self class
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> colocatedSimilarAgentsVerifying: aBlock [
	"Purpose: returns all receiver-like entities located in the same location as the receiver and verifying a specified condition.
Argument: aBlock = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self colocatedSimilarAgentsVerifying: [:a | a sex ~= self sex] "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self colocatedSimilarAgents select: [:a | aBlock value: a]]
]

{ #category : #'star control' }
CMAgentLocation >> delete [
"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self leave.
	super delete
]

{ #category : #deprecated }
CMAgentLocation >> displayOn: aGC [
	
	self halt.
	self
		displayOn: aGC
		at: self center
]

{ #category : #'environment - distance' }
CMAgentLocation >> distanceTo: aSpatialEntityOrSituatedEntity [
	"Purpose: returns the Manhattan distance (in cells) between the patch of the agent and aSpatialEntityOrSituatedEntity
If it is the distance to a situatedEntity, returrns the distance to the patch of this entity.
Argument: aSpatialEntityOrSituatedEntity = <SpatialEntity> or <AgentLocation> or <ObjectLocation>
Return value: <Integer>"
	
	self isSituated ifFalse: [^nil].
	aSpatialEntityOrSituatedEntity isSituated
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity patch].
	aSpatialEntityOrSituatedEntity isSpatialEntity
		ifTrue: [^self patch distanceTo: aSpatialEntityOrSituatedEntity]
]

{ #category : #testing }
CMAgentLocation >> isClassLocation [
	"Answer if the entity is a kind of AgentLocation or of ObjectLocation"
	
	^true
]

{ #category : #'star testing' }
CMAgentLocation >> isSituated [
"Purpose: tests the location somewhere in the spatial grid"
	^patch notNil
]

{ #category : #'star moving' }
CMAgentLocation >> leave [
"Purpose: moves the agent away from the spatial grid (sets his patch attribute to nil): the situated agent is not located any more, but it is still 'alive'  "
	self leaveWhileMoving: false.
]

{ #category : #moving }
CMAgentLocation >> leaveWhileMoving: isMoving [
	"isMoving = <Boolean>"

	self patch isNil
		ifTrue: [ ^ self ].
	isMoving
		ifFalse:
			[ "The situated agent doesn't move; it is not located any more. But it is still 'alive'  "
			self cormasModel spaceModel ifNil: [ ^ nil ].
			self cormasModel spaceModel logLeaveOf: self from: patch.
			"self cormasModel
				registerEntityChange: #leavingOccupant
				from: (EntityReference on: self)" ].
	(self patch theOccupants at: self class name)
		remove: self
		ifAbsent: [  ].
	self patch: nil
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> locatedEntities: locatedEntityName verifying: aBlock withinRadius: range [
	"Purpose: returns all located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self locatedEntities: locatedEntityName withinRadius: range)
				select: [:a | aBlock value: a]]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> locatedEntities: locatedEntityName withinRadius: range [
	"Purpose: returns all located entities of a given type withing a given radius of the current location (all locatedEntityName subclasses are considered).
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self locatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| collec |
	self patch ifNil: [^nil].
	collec := OrderedCollection new.
	(self locationsWithinRadius: range)
		do: [:c | collec addAll: (c occupantsAt: locatedEntityName)].
	(collec includes: self) ifTrue: [collec remove: self].
	^collec
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> locationsVerifying: aBlock withinRadius: range [
	"Purpose: returns the spatial entities within a given radius of the receiver current location and verifying the condition specified in aBlock. 
The current location is considered
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch recursiveNeighbourhood: range verifying: aBlock]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> locationsWithinRadius: range [
	"Purpose: returns a collection a cells within a given radius of the current position
The current location is considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [#()]
		ifFalse: [self patch recursiveNeighbourhood: range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> locationsWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the spatial entities in a given range without any occupant of a given type. 
The current location is considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self locationsWithoutAny: Predator withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch recursiveNeighbourhood: range withoutAny: locatedEntityName]
]

{ #category : #deprecated }
CMAgentLocation >> menu [
	
	| aMenuBuilder |
	self halt.
"	aMenuBuilder := MenuBuilder new.
	aMenuBuilder add: 'Edition' -> [self inspect].
	^aMenuBuilder menu"
]

{ #category : #deprecated }
CMAgentLocation >> moveAndTrackTo: aPatch [
	"Move to aPatch and display a line from origin center to aPatch center"
	"Deprecated"
	
	self moveTo: aPatch
]

{ #category : #'star moving' }
CMAgentLocation >> moveE [
"Purpose: moves eastward if neighbourE exists (raster grid), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourE notNil])
		ifTrue: [self moveTo: self patch neighbourE]
]

{ #category : #'star moving' }
CMAgentLocation >> moveN [
"Purpose: moves northward if neighbourN exists (raster grid with square cells), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourN notNil])
		ifTrue: [self moveTo: self patch neighbourN]
]

{ #category : #'star moving' }
CMAgentLocation >> moveNE [
"Purpose: moves northeastward if neighbourNE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourNE notNil])
		ifTrue: [self moveTo: self patch neighbourNE]
]

{ #category : #'star moving' }
CMAgentLocation >> moveNW [
"Purpose: moves northwestward if neighbourNW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourNW notNil])
		ifTrue: [self moveTo: self patch neighbourNW]
]

{ #category : #moving }
CMAgentLocation >> moveNcells: n towards: aCell [
	"Purpose: moves n cells in direction of a given location.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 5 towards: self house patch"
	
	| path |
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[path := self patch wayTo: aCell.
					path size < n
						ifTrue: [self moveTo: aCell]
						ifFalse: [self moveTo: (path at: n)]]]
]

{ #category : #moving }
CMAgentLocation >> moveNcells: n towards: aCell constraintOnPath: aBlock [
	"Purpose: moves n cells in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
n = <positive Integer>
Example: self moveNcells: 3 towards: self house patch constraintOnPath: [:c | c isClosed not]"
	
	| path |
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[path := self patch wayTo: aCell constraint: aBlock.
					path size < n
						ifTrue: [self moveTo: aCell]
						ifFalse: [self moveTo: (path at: n)]]]
]

{ #category : #'star moving' }
CMAgentLocation >> moveS [
"Purpose: moves southward if neighbourS exists (raster grid with square cells), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourS notNil])
		ifTrue: [self moveTo: self patch neighbourS]
]

{ #category : #'star moving' }
CMAgentLocation >> moveSE [
"Purpose: moves southeastward if neighbourSE exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourSE notNil])
		ifTrue: [self moveTo: self patch neighbourSE]
]

{ #category : #'star moving' }
CMAgentLocation >> moveSW [
"Purpose: moves southwestward if neighbourSW exists (raster grid with hexagons or 8-neighbours squares), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourSW notNil])
		ifTrue: [self moveTo: self patch neighbourSW]
]

{ #category : #moving }
CMAgentLocation >> moveTo: aSpatialEntity [
	"Purpose: moves to a given location.
Argument: aSpatialEntity = <SpatialEntity>
Example: self moveTo: self patch neighbourN"
	
	| alreadySituated |
	aSpatialEntity isSpatialEntity ifFalse: [^nil].
	alreadySituated := self isSituated.	"Log the movement"	"aSpatialEntity spaceModel 
		logMovementOf: self
		from: patch
		to: aSpatialEntity.   temporary inactivated"
	self leaveWhileMoving: true.
	self patch: aSpatialEntity.
	(self patch occupants: self class name) add: self.
	"alreadySituated
		ifFalse:
			[""the agent is arriving on the grid for the first time, the SpaceInterfaces should be aware""
			self currentSimulation
				registerEntityChange: #newOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self)]
		ifTrue:
			[self currentSimulation
				registerEntityChange: #movingOccupant
				with: (EntityReference on: aSpatialEntity)
				from: (EntityReference on: self)]"
]

{ #category : #moving }
CMAgentLocation >> moveTowards: aCell [
	"Purpose: moves one cell in direction of a given location.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house patch"
	
	self isSituated
		ifTrue:
			[self patch = aCell ifFalse: [self moveTo: (self patch wayTo: aCell) first]]
]

{ #category : #moving }
CMAgentLocation >> moveTowards: aCell constraintOnPath: aBlock [
	"Purpose: moves one cell in direction of a given location, taking a specified constraint on each cell of the path to destination.
Argument: aCell = <SpatialEntityElement>
Example: self moveTowards: self house patch constraintOnPath: [:c | c isClosed not]"
	
	self isSituated
		ifTrue:
			[self patch = aCell
				ifFalse:
					[self moveTo: (self patch wayTo: aCell constraint: aBlock) first]]
]

{ #category : #'star moving' }
CMAgentLocation >> moveW [
"Purpose: moves westward if neighbourW exists (raster grid), do not move otherwise"
	
	(self patch notNil and: [self patch neighbourW notNil])
		ifTrue: [self moveTo: self patch neighbourW]
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestEmptyLocation [
	"Purpose: returns the nearest spatial entity with no occupant of any kind. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Return value: <SpatialEntity | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyCell]
]

{ #category : #deprecated }
CMAgentLocation >> nearestEmptyLocation: range [
	"DEPRECATED"
	
	^self nearestEmptyLocationWithinRadius: range
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestEmptyLocationWithinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius of the current location and with no occupant of any kind. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Argument: range = <Integer>
Return value: <SpatialEntity | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyNeighborWithinRadius: range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestEmptyLocations [
	"Purpose: returns the nearest spatial entities with no occupant of any kind.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyCells]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestEmptyLocationsWithinRadius: range [
	"Purpose: returns the nearest spatial entities with no occupant of any kind and within a given radius of the current location.
The current location is NOT considered
Argument: range = <Integer>
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestEmptyNeighborsWithinRadius: range]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> nearestLocatedEntities: locatedEntityName verifying: aBlock withinRadius: range [
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location and fulfilling a specified contraint.
Arguments: 	locatedEntityName = <Symbol | Class>
			aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator verifying: [:a | a isHungry] withinRadius: self perceptionRangePredators"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self nearestLocatedEntities: locatedEntityName withinRadius: range)
				select: [:e | aBlock value: e]]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> nearestLocatedEntities: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest located entities of a given type withing a given radius of the current location.
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(AgentLocation | ObjectLocation) | nil>
Example: self nearestLocatedEntities: #Predator withinRadius: self perceptionRangePredators"
	
	| entities n |
	self patch ifNil: [^nil].
	entities := OrderedCollection new.
	n := 0.
	[entities isEmpty and: [n <= range]]
		whileTrue:
			[entities := self locatedEntities: locatedEntityName withinRadius: n.
			n := n + 1].
	^entities
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestLocationVerifying: aBlock [
	"Purpose: returns the nearest spatial entity fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellVerifying: aBlock]
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestLocationVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	aBlock = <BlockClosure>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborVerifying: aBlock withinRadius: range]
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestLocationWithoutAny: locatedEntityName [
	"Purpose: returns the nearest spatial entity without any occupant of a given type.
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: locatedEntityName = <Symbol | Class>
Return value: <SpatialEntityElement | nil>
Example: self nearestLocationWithoutAny: #Predator"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellWithoutAny: locatedEntityName]
]

{ #category : #'environment - picking - space' }
CMAgentLocation >> nearestLocationWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestLocationWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborWithoutAny: locatedEntityName withinRadius:
					range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsVerifying: aBlock [
	"Purpose: returns the nearest spatial entities fulfilling the constraint specified in aBlock.
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellsVerifying: aBlock]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsVerifying: aCondition withMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude and verifying a specified condition . 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			aCondition = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsVerifying: aCondition withMaxOf: aMagnitudeName
				withinRadius: range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location and fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsVerifying: [:c | c isClosed not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsVerifying: aBlock withinRadius: range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsWithMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsWithoutAny: locatedEntityName [
	"Purpose: returns the nearest spatial entities without any occupant of a given type.
The current location is NOT considered
Arguments: locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntityElement) | nil>
Example: self nearestLocationsWithoutAny: #Predator"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch nearestCellsWithoutAny: locatedEntityName]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> nearestLocationsWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
The current location is NOT considered
Arguments: 	locatedEntityName = <Symbol | Class>
			range = <Integer>
Return value: <Collection(SpatialEntity) | nil>
Example: self nearestLocationsWithoutAny: #Predator withinRadius: self perceptionRangePredators "
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self patch nearestNeighborsWithoutAny: locatedEntityName withinRadius:
					range]
]

{ #category : #'environment - picking - agents' }
CMAgentLocation >> nearestSimilarAgentWithingRadius: range [
	"Purpose: picks RANDOMLY one among the nearest receiver-like entities located withing a given radius of the receiver current location.
If none: returns nil; if more than one: random selection
Argument: 	range = <Integer>
Return value: <AgentLocation | nil>
Example: self nearestSimilarAgentWithinRadius: 2"
	
	| candidates |
	candidates := self nearestSimilarAgentsWithinRadius: range.
	^(candidates isNil or: [candidates isEmpty])
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> nearestSimilarAgentsVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self nearestSimilarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^self
		nearestLocatedEntities: self class name
		verifying: aBlock
		withinRadius: range
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> nearestSimilarAgentsWithinRadius: range [
	"Purpose: returns the nearest receiver-like entities located withing a given radius of the receiver current location.
Argument: 	lrange = <Integer>
Return value: <Collection(AgentLocation) | nil>
Example: self nearestSimilarAgentsWithinRadius: 2"
	
	^self
		nearestLocatedEntities: self class name
		withinRadius: range
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> neighboringLocations [
	"Purpose: return direct neighbours of current location
The current location is NOT considered
Return value: <Collection(SpatialEntity) | nil>"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch neighbourhood]
]

{ #category : #'environment - sensing - space' }
CMAgentLocation >> neighboringLocationsVerifying: aBlock [
	"Purpose: returns direct neighbours of current location fulfilling the constraint specified in aBlock. 
The current location is NOT considered
Argument: aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity) | nil>
Example: self neighboringLocationsVerifying: [:c | c isClosed not]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse: [self patch neighbourhood select: [:c | aBlock value: c]]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> neighbouringLocatedEntities: locatedEntityName [
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName withinRadius: 1)
Arguments: 	locatedEntityName = <Symbol | Class>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Predator"
	
	| collec |
	self patch ifNil: [^nil].
	collec := OrderedCollection new.
	self patch neighbourhood
		do: [:c | collec addAll: (c occupantsAt: locatedEntityName)].
	^collec
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> neighbouringLocatedEntities: locatedEntityName verifying: aCondition [
	"Purpose: returns all entities of a given type located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (for that, use locatedEntities: locatedEntityName verifying: aCondition withinRadius: 1)
Arguments: 	locatedEntityName = <Symbol | Class>
			aCondition = <BlockClosure>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self neighbouringLocatedEntities: #Prey verifying: [:p | p isWeak]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[(self neighbouringLocatedEntities: locatedEntityName)
				select: [:e | aCondition value: e]]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> neighbouringSimilarAgents [
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location.
The co-located entities are not considered here (#neighbouringSimilarAgents is equivalent to #similarAgentsWithinRadius: 1)
Return value: <Collection(AgentLocation)>"
	
	^self neighbouringLocatedEntities: self class name
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> neighbouringSimilarAgentsVerifying: aCondition [
	"Purpose: returns all receiver-like entities located in the direct neighbourhood of the receiver current location and verifying a specified condition.
The co-located entities are not considered here (#neighbouringSimilarAgentsVerifying: aCondition is equivalent to #similarAgentsVerifying: aCondition withinRadius: 1)
Argument: aCondition = <BlockClosure>
Return value: <Collection(AgentLocation)>
Example: self neighbouringSimilarAgentsVerifying: [:a | a sex ~= self sex]"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self neighbouringSimilarAgents select: [:e | aCondition value: e]]
]

{ #category : #accessing }
CMAgentLocation >> patch [
	
	^patch
]

{ #category : #accessing }
CMAgentLocation >> patch: unPatch [
	
	patch := unPatch
]

{ #category : #accessing }
CMAgentLocation >> patchID [
	"Purpose: returns ID of patch
Return value: <Integer>"
	
	self patch ifNil: [^0].
	^self patch id
]

{ #category : #deprecated }
CMAgentLocation >> perceivedCellsWithinRange: anInteger [
	"DEPRECATED"
	
	^self locationsWithinRadius: anInteger
]

{ #category : #deprecated }
CMAgentLocation >> perceivedEntities: locatedEntityName withinRange: range [
	"DEPRECATED"
	
	^self locatedEntities: locatedEntityName withinRadius: range
]

{ #category : #deprecated }
CMAgentLocation >> perceivedSimilarAgentsWithinRange: aRayon [
	"DEPRECATED"
	
	^self similarAgentsWithinRadius: aRayon
]

{ #category : #deprecated }
CMAgentLocation >> perception: aRayon [
	"Return a collection of cells belonging to aRayon (it contains also its current patch)"
	
	^self locationsWithinRadius: aRayon
]

{ #category : #'star moving' }
CMAgentLocation >> randomJump [
"Purpose: moves to a spatial entity randomly picked from the whole grid "

	"patch ifNil: [^nil]."
	self moveTo: (Cormas selectRandomlyFrom: patch grid)
]

{ #category : #'star moving' }
CMAgentLocation >> randomWalk [
"Purpose: moves to a spatial entity randomly picked from the direct neighbourhood (relative distance = 1) of the current location "
| destination |
	patch ifNil: [^nil].
	( patch neighbourhood isNil or: [ patch neighbourhood isEmpty])
		ifTrue: [self halt].
	destination := Cormas selectRandomlyFrom: patch neighbourhood.
	self moveTo: destination
]

{ #category : #moving }
CMAgentLocation >> randomWalk: radius [
	"Purpose: moves to aSpatialEntityElement randomly picked among a radius.
Argument: radius = <positive Integer>
Example: self randomWalk: 2 "
	
	self
		moveTo:
			(Cormas selectRandomlyFrom: (self patch recursiveNeighbourhood: radius))
]

{ #category : #moving }
CMAgentLocation >> randomWalkConstrainedBy: aBlock [
	" Purpose: moves to aSpatialEntityElement randomly picked among the direct neighbours (relative distance = 1) fulfilling the constraint specified in aBlock.  If there is no neighbouring cells fulfilling the constraint, the agent does not move.
	Argument: aBlock = <BlockClosure>
	Example: self randomWalkConstrainedBy: [:c | c noOccupant] 
	"

	| destination destinations |
	patch ifNil: [ ^ nil ].
	destinations := patch neighbourhood select: [ :c | aBlock value: c ].
	destinations isEmpty
		ifTrue: [ ^ self ].
	destination := Cormas selectRandomlyFrom: destinations.
	self moveTo: destination
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> similarAgentsVerifying: aBlock withinRadius: range [
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location and fulfilling a specified constraint
Arguments: aBlock = <BlockClosure>
			range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsVerifying: [:a | a sex ~= self sex] withinRadius: self pheromonePerceptionRange"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self
				locatedEntities: self class name
				verifying: aBlock
				withinRadius: range]
]

{ #category : #'environment - sensing - agents' }
CMAgentLocation >> similarAgentsWithinRadius: range [
	"Purpose: returns the receiver-like instances located withing a given radius of the receiver location
Argument: range = <Integer>
Return value: <Collection(AgentLocation)>
Example: self similarAgentsWithinRadius: 3"
	
	^self patch isNil
		ifTrue: [nil]
		ifFalse:
			[self
				locatedEntities: self class name
				withinRadius: range]
]

{ #category : #accessing }
CMAgentLocation >> sizeOfPOV [
"To be overwritten if needed"
 ^ 20
]

{ #category : #moving }
CMAgentLocation >> walkToMaxOf: aSymbol [
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude.
In case several destinations share the same maximum value, the tie is randomly broken.
Argument: aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
Example: self walkToMaxOf: #sugar"
	
	| destination destinations |
	destinations := self patch neighbourhood
		select: [:c | (c perform: aSymbol) respondsTo: #>].
	destinations isEmpty
		ifFalse:
			[destinations := self patch neighbourhood
				asSortedCollection:
					[:i :j | (i perform: aSymbol) > (j perform: aSymbol)].
			destinations := destinations
				select:
					[:c | (c perform: aSymbol) = (destinations first perform: aSymbol)].
			destination := Cormas selectRandomlyFrom: destinations.
			self moveTo: destination]
]

{ #category : #moving }
CMAgentLocation >> walkToMaxOf: aSymbol constrainedBy: aBlock [
	"Purpose: moves to the spatial entity in the direct neighbourhood (relative distance = 1) with the higher value for a given magnitude and fulfilling the constraint specified in aBlock.
In case several possible destinations share the same maximum value, the tie is randomly broken.
	Arguments:	aSymbol = <Symbol>, most commoly the name of an attribute, it can also be the name of any function returning a magniture
			aBlock = <BlockClosure>
	Example: self walkToMaxOf: #sugar constrainedBy: [:c | c noOccupant]
	"

	| destination destinations |
	destinations := self patch neighbourhood
		select: [ :c | ((c perform: aSymbol) respondsTo: #>) and: [ aBlock value: c ] ].
	destinations isEmpty
		ifTrue: [ ^ self ].
	destinations := destinations
		asSortedCollection: [ :i :j | (i perform: aSymbol) > (j perform: aSymbol) ].
	destinations := destinations
		select: [ :c | (c perform: aSymbol) = (destinations first perform: aSymbol) ].
	destination := Cormas selectRandomlyFrom: destinations.
	self moveTo: destination
]
