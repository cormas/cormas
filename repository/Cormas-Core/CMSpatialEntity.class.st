"
I'm representing a spatial entity. Spatial entities define a topological support for simulations. They hold natural resources and arbitrate their allocation according to pre-defined protocols based on a metaphor of physical harvest.


LEGACY behind this line. To be removed.
---------------------------------------------------------------------------------------------------------------------

newBoss: attributList 
	""Create Entity with only  #id value.
	To add some other values of attributes, newBoss: must be redefine.
Ex: With attributList = OrderedCollection (1  3), this method will create a new instance of ObjectLocation with id= 1 and patchID = 3. Then it will move the entity on the third cell.
To redefine newBoss: it could be as following:
newBoss: attributList 
	| ag |
	ag := super newBoss: (attributList copyFrom: 1 to: 2).
	2 timesRepeat: [attributList removeFirst].
	attributList with: #(#name: #cashbox:)
		do: [:array1Element :array2Element | ag perform: array2Element with: array1Element].

the  attributList = OrderedCollection (1  3 'LandOwner-1' 2000).
The attributs names must have been specified in the #representBinaryOn: instance method.
Ex:
representBinaryOn: bos 
	| msg |
	msg := super representBinaryOn: bos.
	msg arguments first add: self name; add: self cashbox.
	^msg

Then, the first 3 values of attributList must be for the #id, #dead and patchID of the agent.
The others are for the name and the cashbox values.""

	| ag |
	ag := self new.
	attributList do: [: assoc | 
ag update: (assoc key asString) to:  assoc value
""ag perform: (assoc key, ':') asSymbol with: assoc value""].
	^ag

"
Class {
	#name : #CMSpatialEntity,
	#superclass : #CMEntity,
	#instVars : [
		'spaceModel',
		'neighbourhood',
		'destroyed',
		'outline',
		'edge',
		'theOccupants',
		'theCSE',
		'includedEntities'
	],
	#classInstVars : [
		'bounds'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'- accessing' }
CMSpatialEntity class >> bounds [
	
	^bounds
]

{ #category : #'- accessing' }
CMSpatialEntity class >> bounds: x [
	
	bounds := x
]

{ #category : #'- displaying' }
CMSpatialEntity class >> createEntityPOVwithSpec: aSpec defaultPov: aDefaultPov [
	"Returns an EntityPOV according to selectorName and aSymbolOrColorValue"
	
	| anEntityPOV aSymbolOrColorValue selectorName |
	aSymbolOrColorValue := aSpec povResult.
	selectorName := aSpec povSelector.
	anEntityPOV := aDefaultPov copy.
	anEntityPOV
		color:
			(aSymbolOrColorValue cormasHelper isTypeColorValue
				ifTrue: [aSymbolOrColorValue]
				ifFalse: [self colorAtPov: aSymbolOrColorValue]).
	anEntityPOV name: selectorName.
	anEntityPOV povResult: aSymbolOrColorValue.
	anEntityPOV infoName: aSpec infoName.
	anEntityPOV infoResult: aSpec infoResult.
	^anEntityPOV
]

{ #category : #'+ utilities - colors' }
CMSpatialEntity class >> defaultColor [
	"Purpose: return the default color of the current class name.
	Ex: CMEntity defaultColor => ColorValue lightGray ; CMECECForager defaultColor => ColorValue veryLightGray"

	self colorsDict isEmpty
		ifTrue: [ ^ super defaultColor ]
		ifFalse: [ ^ self colorsDict at: self name ifAbsent: [ super defaultColor ] ]
]

{ #category : #'- testing' }
CMSpatialEntity class >> isSpatialClass [
	^ true
]

{ #category : #'- default value' }
CMSpatialEntity class >> neighbourhood_default [
	
	^OrderedCollection new
]

{ #category : #'- instance creation' }
CMSpatialEntity class >> new [
	"Each subclass (Class) of SpatialEntity should use 'Class new: aSpaceModel' "
	
	self error: 'Should use ''new: '' with a spaceModel as argument !'
]

{ #category : #'- instance creation' }
CMSpatialEntity class >> new: aSpaceModel [
	| anEntity |
	anEntity := super new.
	aSpaceModel notNil
		ifTrue: [ anEntity spaceModel: aSpaceModel.
			anEntity collector: aSpaceModel cormasModel collector.
			aSpaceModel cormasModel collect: anEntity.
			anEntity initOccupants ].
	^ anEntity
]

{ #category : #'- default value' }
CMSpatialEntity class >> theCSE_default [
	
	^Dictionary new
]

{ #category : #'- default value' }
CMSpatialEntity class >> theOccupants_default [
	
	^Dictionary new
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> allLayersTo: radius [
	"returns a collection (collResult) of layers :
		- index of collResult is the distance to this layer, 
		- each sub collection is a layer of cells.
radius = integer >= 0.
ex: collResult =	
		[1 ->#(self)
		2 ->#(self neighbourhood)
		3 -> #(layer 2)
		4 -> #(layer 3)  ...]"
	
	| layer1 layer2 collResult |
	collResult := OrderedCollection new: radius.
	layer1 := Array with: self.
	collResult add: layer1.
	radius = 0 ifTrue: [^collResult].
	layer2 := self neighbourhood.
	collResult add: layer2.
	[collResult size < (radius + 1)]
		whileTrue:
			[collResult add: (self layer3FromLayer2: layer2 andLayer1: layer1) first.
			layer2 := collResult last.
			layer1 := collResult at: collResult size - 1].
	^collResult
]

{ #category : #'+ environment - sensing - agents' }
CMSpatialEntity >> allOccupants [
	"Purpose: returns all the entities located there
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| collec |
	collec := OrderedCollection new.
	self theOccupants values do: [:v | collec addAll: v].
	^collec
]

{ #category : #'star testing' }
CMSpatialEntity >> belongsToAggregate: aSpatialEntity [
"Purpose: tests if the receiver belongs to a higher level spatial entity, even if theCSE is nil. 
This method is valid whatever the aggregate level and even if theCSE is nil. It will return 'true' if the receiver is a component of a component of aSpatialEntity
Argument: aSpatialEntity = <SpatialEntitySet>
Return value: <Boolean>"
	
	^aSpatialEntity containsCell: self
]

{ #category : #'+ displaying' }
CMSpatialEntity >> color: aColorSymbol [
	"Purpose: changes background color to a given color (to draw observer attention to the receiver). If aColorSymbol is not a standard Color, it displays the entity in red.
	Argument: aColorSymbol = <ByteSymbol> or <String>
	Example: self color: #pink"
	
	(Color registeredColorNames includes: aColorSymbol asSymbol)
		ifTrue: [ self flashColor: (Color perform: aColorSymbol asSymbol) ]
		ifFalse: [ self flashColor: Color red ]
]

{ #category : #'+ displaying' }
CMSpatialEntity >> colorI: aColorSymbol [
	"Purpose: for each included spatial entities, changes background color to a given color (to draw observer attention to the neighbourhood)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorI: #pink"
	
	self includedEntities isNil
		ifFalse: [self includedEntities do: [:v | v color: aColorSymbol]]
]

{ #category : #'+ displaying' }
CMSpatialEntity >> colorN: aColorSymbol [
	"Purpose: for each neighours, changes background color to a given color (to draw observer attention to the neighbourhood)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorN: #pink"
	
	self neighbourhood isNil
		ifFalse: [self neighbourhood do: [:v | v color: aColorSymbol]]
]

{ #category : #'- accessing' }
CMSpatialEntity >> compoundSpatialClasses [
	
	^theCSE
]

{ #category : #control }
CMSpatialEntity >> connexity [
	"Purpose: returns the value of the grid connexity, i.e. 8, 4 or 6.
If the grid is irregular, returns the number of neighbors of the current cell"
	
	self spaceModel gridCellShape = #irregular
		ifTrue: [^self neighbourhood size].
	^self spaceModel connexity
]

{ #category : #'- displaying' }
CMSpatialEntity >> delimitors [
	
	^#nil
]

{ #category : #'- initialize-release' }
CMSpatialEntity >> destroyed [
	"Answer if the entity is destroyed or not"
	
	^destroyed ifNil: [destroyed := false]
]

{ #category : #'- initialize-release' }
CMSpatialEntity >> destroyed: aBoolean [
	
	destroyed := aBoolean
]

{ #category : #'- deprecated' }
CMSpatialEntity >> distCenter: aSpatialEntity [
	"DEPRECATED. You shouldn't use this method: the result depend of the size of the displayed grid ! If you modify the size of the windows, the result will change !!  :o(
So, be carefull. You should rather use 'distCell: aSpatialEntity' .
returns a distance in cells, between the sender and aSpatialEntity."
	
	^self center dist: aSpatialEntity center
]

{ #category : #'+ environment - distance' }
CMSpatialEntity >> distanceTo: anotherSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and aSpatialEntity
Argument: anotherSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	self subclassResponsibility
]

{ #category : #'- accessing' }
CMSpatialEntity >> edge [
	
	^edge
]

{ #category : #'- accessing' }
CMSpatialEntity >> edge: anObject [
	
	edge := anObject
]

{ #category : #'+ environment - distance' }
CMSpatialEntity >> euclideanDistanceTo: anotherSpatialEntity [
	"Purpose: returns the distance between the receiver and another spatialEntity, using the Euclidean distance formula: 
	square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: anotherSpatialEntity = <SpatialEntity>"
	
	self subclassResponsibility
]

{ #category : #'star displaying' }
CMSpatialEntity >> flash [
"Purpose: changes background color to yellow (to draw observer attention to the receiver)"
	self flashColor: ColorValue yellow
]

{ #category : #'- displaying' }
CMSpatialEntity >> flashColor: aColorValue [
	"Purpose: changes background color to a given color (to draw observer attention to the receiver). If aColorValue is not a standard Color, it displays the entity in red.
	Argument: aColorValue = <ColorValue> or <String> or <Symbol>
	Example: self flashColor: ColorValue pink or self flashColor: #pink"

	aColorValue isString
		ifTrue: [ ^ self flashColor: (Color perform: aColorValue asSymbol) ].
	self cormasModel
		registerEntityChange: #flash
		with: aColorValue
		from: (EntityReference on: self)
]

{ #category : #'star displaying' }
CMSpatialEntity >> flashN [
"Purpose: for each neighours, changes background color to yellow (to draw observer attention to the neighbourhood)"

	self neighbourhood isNil 
		ifFalse: [self neighbourhood do: [:v | v flash]]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> grid [
	"Purpose: returns the grid, i.e. the list of all the spatial element entities.
Return value: <Collection(SpatialElementEntity)>"
	
	^self spaceModel elementaryEntities
]

{ #category : #'star testing' }
CMSpatialEntity >> hasOccupantType: locatedEntityName [
"Purpose: test if there is an occupant of a given type.
Argument: locatedEntityName = <Symbol | AgentLocation | ObjectLocation>
Return value: <Boolean>
Example: self hasOccupantType: #Tree"
	
	^(self occupantsAt: locatedEntityName) isEmpty not
]

{ #category : #'- accessing' }
CMSpatialEntity >> includedEntities [
	
	^includedEntities ifNil: [includedEntities := Set new]
]

{ #category : #'- accessing' }
CMSpatialEntity >> includedEntities: x [
	
	includedEntities := x
]

{ #category : #'- initialize-release' }
CMSpatialEntity >> init: aSpaceModel [
	"self spaceModel: aSpaceModel.
	self privateInit.
	self spaceModel cormasModel class locatedClasses isEmpty ifFalse: [self initOcc: self spaceModel cormasModel class locatedClasses]"
	
	
]

{ #category : #'- initialize-release' }
CMSpatialEntity >> initOccupants [
	
	self allOccupants do: [:a | a leave]	"self spaceModel cormasModel class occupantClasses isEmpty 
		ifFalse: 
			[self allOccupants do: [:a | a leave].
			theOccupants := Dictionary new.
			self spaceModel cormasModel class occupantClasses 
				do: [:e | theOccupants at: (e name) put: OrderedCollection new]]"
]

{ #category : #'star testing' }
CMSpatialEntity >> isComponentOf: aSpatialEntity [ 
"Purpose: tests if the receiver belongs to the components of a given compound spatial entity
It will return 'false' if the receiver is a component of a component of aSpatialEntity (cf. belongsToAggregate:)
Argument: aSpatialEntity = <SpatialEntitySet>
Return value: <Boolean>
Example: self isComponentOf: Forest"

	^(self theCSE keys includes: aSpatialEntity name)
		and: [(self theCSE at: aSpatialEntity name) isNil not]
]

{ #category : #'- testing' }
CMSpatialEntity >> isCrossedByArc: anArc [
	"answer if the SpatialEntity is crossed by anArc"
	
	self subclassResponsibility
]

{ #category : #'- testing' }
CMSpatialEntity >> isElementary [
	
	self subclassResponsibility
]

{ #category : #'+ testing' }
CMSpatialEntity >> isSpatialEntity [
	
	^true
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> layer3FromLayer2: aSet2 andLayer1: aSet1 [
	"returns an collection of 2 arrays of cells: layers 3 and 2"
	
	| newLayer |
	newLayer := OrderedCollection new.
	aSet2
		do:
			[:cell | 
			newLayer
				addAll:
					(cell neighbourhood
						select:
							[:c2 | (aSet2 includes: c2) not and: [(aSet1 includes: c2) not]])].
	newLayer := Array withAll: newLayer.
	^OrderedCollection with: newLayer with: aSet2
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> layerOfRadius: radius [
	"Purpose: returns the spatial entities belonging to the appropriate layer.of recursive neighbourhood
Argument: radius = <Integer>
Return value: <Collection(SpatialEntity)>"
	
	^(self allLayersTo: radius) last
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> myCSE: aClassOrClassName [
	"Purpose: returns the instance of a given higher level spatialEntity the receiver belongs to.
Argument:  aClassOrClassName can be an entity class or the name of an entity <ByteSymbol>
Return value: <SpatialEntitySet | nil>
Example: self myCSE: Forest
Example: self myCSE: #Plot"
	
	| aClassName |
	aClassOrClassName isSymbol
		ifTrue: [aClassName := aClassOrClassName]
		ifFalse: [aClassName := aClassOrClassName name].
	^((self theCSE includesKey: aClassName) not
		or: [(self theCSE at: aClassName) isNil])
		ifTrue: [nil]
		ifFalse: [self theCSE at: aClassName]
]

{ #category : #'- deprecated' }
CMSpatialEntity >> myOccupantAt: className [
	"deprecated. should use #occupantsAt:"
	
	^self occupantsAt: className
]

{ #category : #'- deprecated' }
CMSpatialEntity >> myOccupants: className [
	"deprecated. should use #occupantsAt:"
	
	^self occupantsAt: className
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> nciAbout: aCSE [
	"Purpose: returns the proportion of neighbours belonging to a given compound spatial entity, a kind of neighbourhood coherence index
Argument: aCSE = <SpatialEntitySet>
Return value: <Fraction>
Example: self nciAbout: (self myCSE: #Forest)"
	
	^(self neighbourhood select: [:c | aCSE components includes: c]) size
		/ self neighbourhood size
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestCellVerifying: aCondition [
	"Purpose: returns the nearest cell verifying a condition specified as aBlock.
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>
Generic method to be used for polygonal cells and compound spatial entities. For cells (elementary square or hexagonal spatial entities), see methods in class SpatialEntitryElement 
Example := self nearestCellVerifying: [:aCell | aCell landCover = #water]"
	
	^self
		nearestCellVerifying: aCondition
		constraintOnPath: [:aCell | true]
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestCellVerifying: condition1 constraintOnPath: condition2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Generic method to be used for polygonal cells and compound spatial entities. For cells (elementary square or hexagonal spatial entities), see methods in class SpatialEntitryElement 
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	self subclassResponsibility
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestEmptyNeighborWithinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius and with no occupant of any kind. 
If none: returns nil; if more than one at the minimum radius: random selection
Argument: range = <Integer>
Return value: <SpatialEntity | nil>"
	
	| locations |
	locations := self nearestEmptyNeighborsWithinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> nearestEmptyNeighborsWithinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius and with no occupant of any kind.
Argument: range = <Integer>
Return value: <Collection(SpatialEntity)>"
	
	^self
		nearestNeighborsVerifying: [:n | n noOccupant]
		withinRadius: range
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestNeighborVerifying: aBlock withMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entity verifying a specified condition with the higest value of a given function in a given radius. 
The current location is NOT considered
If none: returns nil; if more than one with the highest value at the minimum radius: random selection
Arguments: aBlock = <BlockClosure>
			aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborVerifying: [:c | c isPolluted not] withMaxOf: #water withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsVerifying: aBlock withMaxOf:
			aMagnitudeName withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestNeighborVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entity within a given radius and fulfilling a specified constraint. 
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborVerifying: [:c | c waterLevel < 2] withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsVerifying: aBlock withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestNeighborWithMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entity with the higest value of a given function in a given radius. 
The current location is NOT considered
If none: returns nil; if more than one with the highest value at the minimum radius: random selection
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborWithMaxOf: #biomass withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsWithMaxOf: aMagnitudeName withinRadius:
			range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> nearestNeighborWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entity in a given range without any occupant of a given type. 
If none: returns nil; if more than one at the minimum radius: random selection
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <SpatialEntity | nil>
Example: self nearestNeighborWithoutAny: #Tree withinRadius: 3 "
	
	| locations |
	locations := self nearestNeighborsWithoutAny: locatedEntityName
		withinRadius: range.
	^locations isEmpty
		ifFalse: [Cormas selectRandomlyFrom: locations]
		ifTrue: [nil]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> nearestNeighborsVerifying: aCondition withMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude and verifying a specified condition. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			aCondition = <BlockClosure>
			range = <Integer>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithMaxOf: #water verifying: [:c | c isPolluted not] withinRadius: 5"
	
	| locations |
	locations := Cormas
		selectEntitiesWithMaxOf: aMagnitudeName
		amongEntities: (self recursiveNeighbourhood: range)
		verifying: aCondition.
	locations
		remove: self
		ifAbsent: [].
	locations := locations
		asSortedCollection: [:i :j | (i distanceTo: self) < (j distanceTo: self)].
	locations := locations
		select: [:c | (c distanceTo: self) = (locations first distanceTo: self)].
	^locations
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> nearestNeighborsVerifying: aBlock withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius and fulfilling a specified constraint.
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsVerifying: [:c | c isClosed not] withinRadius: 7"
	
	| locations n |
	locations := OrderedCollection new.
	n := 1.
	[locations isEmpty and: [n <= range]]
		whileTrue:
			[locations := self recursiveNeighbourhood: n verifying: aBlock.
			n := n + 1].
	locations
		remove: self
		ifAbsent: [].
	^locations
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> nearestNeighborsWithMaxOf: aMagnitudeName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius of the current location with the maximum value of a given magnitude. 
The current location is NOT considered
Arguments: aMagnitudeName = <ByteSymbol>
			range = <Integer>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithMaxOf: #water withinRadius: 5"
	
	^self
		nearestNeighborsVerifying: [:c | true]
		withMaxOf: aMagnitudeName
		withinRadius: range
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> nearestNeighborsWithoutAny: locatedEntityName withinRadius: range [
	"Purpose: returns the nearest spatial entities within a given radius and without any occupant of a given type.
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntity)>
Example: self nearestNeighborsWithoutAny: #Tree withinRadius: 5 "
	
	^self
		nearestNeighborsVerifying: [:p | p noOccupantType: locatedEntityName]
		withinRadius: range
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> neighborsStringWithSeparator: aChar [
	"Purpose: returns a string made of 'self id' as first element and the id of all neighbors separated by aChar
Argument: aChar = <Character>
Return value: <ByteString>"
	
	| string |
	string := self id printString.
	self neighbourhood isNil
		ifFalse:
			[self neighbourhood
				do:
					[:i | string := string , aChar asSymbol asString , i id printString]].
	^string
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> neighbourhood [
	"Return a collection of spatialEntities (without the nil)"
	"^self orderedNeighbourhood select: [:spEnt | spEnt notNil]"
	
	^neighbourhood
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> neighbourhood: something [
	"self subclassResponsibility ???"
	
	neighbourhood := something
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> neighbourhoodAndSelf [
	"Purpose: returns the spatial entities belonging to the direct neighbourhood of the receiver
Also includes the receiver itself
self neighbourhoodAndSelf == self recursiveNeighbourhood: 1
Return value: <Collection(SpatialEntity)>"
	
	| collec |
	collec := self neighbourhood asOrderedCollection.
	collec addFirst: self.
	^collec
]

{ #category : #'- deprecated' }
CMSpatialEntity >> neighboursMaxOf: aMagnitudeName [
	
	^Cormas
		maxOf: aMagnitudeName
		amongObjects: self neighbourhood
]

{ #category : #'star testing' }
CMSpatialEntity >> noOccupant [
"Purpose: tests if there is no occupant of any kind.
Return value: <Boolean>"

	| test |
	test := true.
	self theOccupants notNil ifTrue: [self theOccupants values do: [:list | list isEmpty ifFalse: [test := false]]].
	^test
]

{ #category : #'star testing' }
CMSpatialEntity >> noOccupantBut: anAgent [
	"Purpose: tests if there is no occupant of any kind, excepted anAgent.
Useful from an agent perspective, to test if there are other agents on the cell: self patch noOccupantBut: self.
Return value: <Boolean>"
	
	| test |
	test := true.
	self theOccupants notNil
		ifTrue:
			[self theOccupants values
				do:
					[:list | list isEmpty ifFalse: [(list includes: anAgent) ifFalse: [test := false]]]].
	^test
]

{ #category : #'star testing' }
CMSpatialEntity >> noOccupantType: locatedEntityName [
"Purpose: tests if there is no occupant of given type.
Argument: locatedEntityName = <Symbol | AgentLocation | ObjectLocation>
Return value: <Boolean>
Example: self noOccupantType: #Tree"
	
	^(self occupantsAt: locatedEntityName) isEmpty
]

{ #category : #'+ environment - sensing - agents' }
CMSpatialEntity >> occupants: aClassOrClassName [
	"Purpose: returns all the entities of a given class name located there
Argument: aClassOrClassName = <ByteSymbol> or a Cormas Entity Class
Note that the instances of subclasses are NOT considered by this method, contrarily to #occupantsAt: and #occupantsType: 
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| aClassName |
	aClassOrClassName isSymbol
		ifTrue: [aClassName := aClassOrClassName]
		ifFalse: [aClassName := aClassOrClassName name].
	^self theOccupants
		at: aClassName
		ifAbsentPut: [OrderedCollection new]
]

{ #category : #'+ environment - sensing - agents' }
CMSpatialEntity >> occupantsAt: locatedEntityName [
	"Purpose: returns all the entities of a given type located there
Argument: locatedEntityName = <ByteSymbol | AgentLocation | ObjectLocation>
Note that the instances of subclasses ARE CONSIDERED by this method, contrarily to #occupants:
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| aClass |
	aClass := locatedEntityName isSymbol
		ifTrue: [locatedEntityName class]
		ifFalse: [locatedEntityName].
	^self occupantsType: aClass
]

{ #category : #'+ environment - sensing - agents' }
CMSpatialEntity >> occupantsType: aClass [
	"Purpose: returns all the entities of a given type located there
Argument: locatedEntityName = <AgentLocation | ObjectLocation>
Note that the instances of subclasses ARE CONSIDERED by this method, contrarily to #occupants:
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| instances |
	instances := OrderedCollection new.
	aClass ifNil: [^instances].
	aClass withAllSubclasses
		do: [:class | instances addAll: (self occupants: class name)].
	^instances
]

{ #category : #'- accessing' }
CMSpatialEntity >> outline [
	
	^outline
]

{ #category : #'- accessing' }
CMSpatialEntity >> outline: a [
	
	outline := a
]

{ #category : #'- deprecated' }
CMSpatialEntity >> peripherieRayon: n [
	"DEPRECATED. Should use 'layerOfRadius: radius' "
	
	^self layerOfRadius: n
]

{ #category : #'star pov' }
CMSpatialEntity >> randomColor [
	
	^ Color 
		red: Cormas simpleRandom
		green: Cormas simpleRandom
		blue: Cormas simpleRandom
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> randomNeighbour [
	"Purpose: returns a neighbour randomly chosen
Return value: <SpatialEntity>"
	
	^Cormas selectRandomlyFrom: self neighbourhood
]

{ #category : #'+ environment - picking - space' }
CMSpatialEntity >> randomNeighbourVerifying: aCondition [
	"Purpose: returns a neighbour randomly chosen among those verifying a given condition
Argument: aCondition = <BlockClosure>
Return value: <SpatialEntity | nil>"
	
	| candidates |
	candidates := self neighbourhood select: [:se | aCondition value: se].
	^candidates isEmpty
		ifTrue: [nil]
		ifFalse: [Cormas selectRandomlyFrom: candidates]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> recursiveNeighbourhood: radius [
	"Purpose: returns a collection of receiver-like spatial entities within a given radius of the receiver.
The receiver itself is included in the collection, which is ordered from the center (self) to the perimeter of the radius.
Argument: radius = <Integer>
Return value: <OrderedCollection>
Example: self recursiveNeighbourhood: 0 (== OrderedCollection with: self)
Example: self recursiveNeighbourhood: 1 (== self neighbourhoodAndSelf)"
	
	| allCells layers |
	allCells := OrderedCollection new.
	layers := self allLayersTo: radius.
	layers do: [:layer | allCells addAll: layer].
	^allCells
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> recursiveNeighbourhood: range verifying: aBlock [
	"Purpose: returns the spatial entities within a given radius and fulfilling the constraint specified in aBlock. 
Arguments: range = <Integer>
			aBlock = <BlockClosure>
Return value: <Collection(SpatialEntity)>
Example: self recursiveNeighbourhood: 5 verifying: [:c | c isClosed not] "
	
	^(self recursiveNeighbourhood: range) select: [:p | aBlock value: p]
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> recursiveNeighbourhood: range withoutAny: locatedEntityName [
	"Purpose: returns the spatial entities within a given radius and without any occupant of a given type.
Arguments: range = <Integer>
			locatedEntityName = <Symbol | Class>
Return value: <Collection(SpatialEntity)>
Example: self recursiveNeighbourhood: 5 withoutAny: #Tree"
	
	^self
		recursiveNeighbourhood: range
		verifying: [:p | p noOccupantType: locatedEntityName]
]

{ #category : #'- initialize-release' }
CMSpatialEntity >> release [
	"Free my dependents "
	
	destroyed := true.
	^super release
]

{ #category : #'+ initialize-release' }
CMSpatialEntity >> reset [
	"Purpose: resets inherited and specific attributes"
	
	super reset.
	theCSE := nil.
	includedEntities := nil.
	self initOccupants
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntity >> select: aPoint [
	
	^self outline regionIntersects: (aPoint extent: 1)
]

{ #category : #'+ environment - distance' }
CMSpatialEntity >> shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock [
	"Purpose: gets the shortest distance (in cell unit) to a collection of other cells, taking a specified constraint into account.
Arguments: aCollecOfCells = <Collection(SpatialEntityElement)>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCells: self myPlots constraintOnPath: [:aCell | aCell isClosed not]"
	
	self subclassResponsibility
]

{ #category : #'+ environment - distance' }
CMSpatialEntity >> shortestDistanceToCellsVerifying: aCondition [
	"Purpose: gets the shortest distance (in cell unit) to a cell verifying a specified condition.
Arguments: aCondition = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest]"
	
	self subclassResponsibility
]

{ #category : #'+ environment - distance' }
CMSpatialEntity >> shortestDistanceToCellsVerifying: aCondition constraintOnPath: aBlock [
	"Purpose: gets the shortest distance (in cell unit) to a cell verifying a specified condition, taking a specified constraint on the path into account.
Arguments: aCondition = <BlockClosure>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCellVerifying: [:c | c landCover = #forest] constraintOnPath: [:c | c isClosed not]"

	| targetCell |
	targetCell := self nearestCellVerifying: aCondition constraintOnPath: aBlock.
	^ targetCell isNil
		ifTrue: [ self cormas warn: 'there is no nearest cell' ]
		ifFalse: [ self distanceTo: targetCell ]
]

{ #category : #'- obsolete' }
CMSpatialEntity >> show [
	"	DEPRECATED. Should 'nt be used anymore.
	The only way to ask an entity to be displayed is FLASH"
	
	
]

{ #category : #'- accessing' }
CMSpatialEntity >> spaceModel [
	
	^ spaceModel
]

{ #category : #'- accessing' }
CMSpatialEntity >> spaceModel: aSpaceModel [
	
	spaceModel := aSpaceModel
]

{ #category : #'- accessing' }
CMSpatialEntity >> theCSE [
	
	^theCSE ifNil: [theCSE := Dictionary new]
]

{ #category : #'- accessing' }
CMSpatialEntity >> theCSE: aDict [
	
	theCSE := aDict
]

{ #category : #'- accessing' }
CMSpatialEntity >> theOccupants [
	
	^theOccupants ifNil: [theOccupants := Dictionary new]
]

{ #category : #'- accessing' }
CMSpatialEntity >> theOccupants: aDict [
	
	theOccupants := aDict
]

{ #category : #'- displaying' }
CMSpatialEntity >> view [
	
	^self spaceModel vue
]

{ #category : #'- displaying' }
CMSpatialEntity >> views [
	
	^self spaceModel vues
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntity >> wayTo: anotherSpatialEntity [
	"Purpose: returns one of the shortest path to another spatial entity
Argument: anotherSpatialEntity = <SpatialEntity>"
	
	self subclassResponsibility
]
