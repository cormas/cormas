"
Instance Variables:
	components	<Collection(SpatialEntity)>  collection of constituent elements
	type	<CharacterArray>  descriptor
	surround	<Collection(SpatialEntity)>  outer perimeter (neighbours of inner perimeter)

"
Class {
	#name : #CMSpatialEntitySet,
	#superclass : #CMSpatialEntity,
	#instVars : [
		'components',
		'type',
		'surround'
	],
	#category : #'Cormas-Core-Entities'
}

{ #category : #'- displaying' }
CMSpatialEntitySet class >> createEntityPOVwithSpec: aSpec componentsPovs: componentsPovs [
	"Returns an EntityPOV according to aSpec and set of povs of component spatial entity
	componentsPovs should be -> aCollecOfEntities collect: [:spatialEntity | spatialEntity defaultPOV]."
	
	| anEntityPOV aSymbolOrColorValue selectorName |
	aSymbolOrColorValue := aSpec povResult.
	selectorName := aSpec povSelector.
	anEntityPOV := VectorialCompositePOV newFrom: componentsPovs.
	selectorName = #nil
		ifFalse:
			[selectorName = #delimitors
				ifTrue:
					[anEntityPOV isStroked: true.
					anEntityPOV lineWidth: 3]
				ifFalse:
					[aSymbolOrColorValue cormasHelper isTypeColorValue
						ifTrue: [anEntityPOV color: aSymbolOrColorValue]
						ifFalse: [anEntityPOV color: (self colorAtPov: aSymbolOrColorValue)]]].
	anEntityPOV name: selectorName.
	anEntityPOV povResult: aSymbolOrColorValue.
	anEntityPOV infoName: aSpec infoName.
	anEntityPOV infoResult: aSpec infoResult.
	^anEntityPOV
]

{ #category : #testing }
CMSpatialEntitySet class >> isElementary [
	
	^false
]

{ #category : #testing }
CMSpatialEntitySet class >> isSpatialEntitySetClass [
	
	^true
]

{ #category : #'instance-creation' }
CMSpatialEntitySet class >> newWith: aSetOfSpatialEntitiesOrAnObject [
	"Return a new instance of SpatialEntitySet, made of aSetOfSpatialEntitiesOrAnObject
aSetOfSpatialEntitiesOrAnObject = aSpatialEntity  or a Collection of SpatialEntities"
	
	| theSpaceModel coll |
	(aSetOfSpatialEntitiesOrAnObject class inheritsFrom: Collection)
		ifTrue: [coll := aSetOfSpatialEntitiesOrAnObject asOrderedCollection]
		ifFalse:
			[coll := OrderedCollection with: aSetOfSpatialEntitiesOrAnObject].
	theSpaceModel := coll first spaceModel.
	^theSpaceModel createOneAggregate: self from: coll
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addComponent: aSpatialEntity [
	"Purpose: adds a given component and notifies the change to dependents
Argument: aSpatialEntity = <SpatialEntity>"

	aSpatialEntity compoundSpatialClasses at: self class name put: self.
	self components add: aSpatialEntity.
	self setSurround.
	self cormasModel
		registerEntityChange: #compositionChanged
		with: (EntityReference onEntities: self components)
		from: (EntityReference on: self)
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addComponents: aCollecOfSpatialEntities [
	"Purpose: adds a given aCollecOfSpatialEntities of components and notifies the change to dependents
Argument: aCollecOfSpatialEntities = <Collection(SpatialEntity)>
Example: self addComponents: self surround"

	self components addAll: aCollecOfSpatialEntities.
	aCollecOfSpatialEntities
		do: [ :c | c theCSE at: self class name put: self ].
	self setSurround.
	self cormasModel
		registerEntityChange: #compositionChanged
		with: (EntityReference onEntities: self components)
		from: (EntityReference on: self)
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSilentlyComponent: cell [
	"Purpose: silently adds a given component (do not notify the change to dependents and do not recalulate the surrounding)
Argument: aSpatialEntity = <SpatialEntity>
Example: self addSilentlyComponent: aCell"
	
	cell compoundSpatialClasses
		at: self class name
		put: self.
	self components add: cell
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSilentlyComponents: aCollecOfSpatialEntities [
	"Purpose: adds silently a given aCollecOfSpatialEntities of components (do not notify the change to dependents and do not recalulate the surrounding)
Argument: aCollecOfSpatialEntities = <Collection(SpatialEntity)>
Example: self addSilentlyComponents: self surround"
	
	self components addAll: aCollecOfSpatialEntities.
	aCollecOfSpatialEntities
		do:
			[:c | 
			c theCSE
				at: self class name
				put: self]
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSurroundings [
	"Purpose: swells on its outer perimeter by the surrounding components 
Return value: <Boolean> (has it spread or not)"
	
	^self addSurroundingsVerifying: [:c | true]
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSurroundingsN: nbNewCells [
	"Purpose: swells on its outer perimeter by a givent number of new components
Argument: nbNewCells = <Integer>
Return value: <Boolean> (has it spread or not)
Example: self swellWithNbCells: 10"
	
	^self
		addSurroundingsN: nbNewCells
		verifying: [:c | true]
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSurroundingsN: nbNewCells verifying: aCondition [
	"Purpose: swells on its outer perimeter by a givent number of new components verifying a specified condition
Arguments: nbNewCells = <Integer>
			aCondition = <BlockClosure>
Return value: <Boolean> (has it spread or not)
Example: self swellWithNbCells: 10 verifying: [:c | c isClosed not]"

	| newCells targetSize nbRemainingAdditions |
	nbRemainingAdditions := nbNewCells.
	targetSize := self size + nbNewCells.
	[ nbRemainingAdditions > 0 ]
		whileTrue: [ newCells := self surround
				select: [ :c | (c isComponentOf: self class) not and: [ aCondition value: c ] ].
			newCells := Cormas
				selectRandomlyFrom: newCells
				subCollectionSize: targetSize - self size.
			nbRemainingAdditions := newCells isEmpty
				ifTrue: [ 0 ]
				ifFalse: [ nbRemainingAdditions - newCells size ].
			self addComponents: newCells ].
	^ newCells isNotEmpty
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> addSurroundingsVerifying: aCondition [
	"Purpose: swells on its outer perimeter by the surrounding components verifying a specified condition
Argument: aCondition = <BlockClosure>
Return value: <Boolean> (has it spread or not)
Example: self addSurroundingsVerifying: [:c | c isClosed not]"

	| newCells |
	newCells := self surround
		select: [ :c | (c isComponentOf: self class) not and: [ aCondition value: c ] ].
	self addComponents: newCells.
	^ newCells isNotEmpty
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> at: index [
	"Purpose: answers the value of an indexable component in the receiver
Argument: index = <Integer>
Return value: <SpatialEntity>"
	
	^self components asOrderedCollection at: index
]

{ #category : #'- obsolete' }
CMSpatialEntitySet >> changedWithNewComponents: aCollecOfComponents [
	"the shape of the aggregate has changed, then new POVs must be created"
	self deprecated: 'not used anymore, the direct notification to the POVs has been replaced by a notification via the spaceModel Old method : self povs do: [: aPov | aPov addAll: aCollecOfComponents]. This method will disappear in the next version'.
	self cormasModel spaceModel dispatchOneCompoundSpatialEntity: self
]

{ #category : #'+ displaying' }
CMSpatialEntitySet >> colorC: aColor [
	"Purpose: for each component, changes background color to a given color (to draw observer attention to the components)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorC: #pink"
	
	self components isNil
		ifFalse: [self components do: [:v | v color: aColor]]
]

{ #category : #'+ displaying' }
CMSpatialEntitySet >> colorE: aColor [
	"Purpose: for each element of the epidermis, changes background color to a given color (to draw observer attention to the surround)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorS: #pink"
	
	self getEpidermis do: [:v | v color: aColor]
]

{ #category : #'+ displaying' }
CMSpatialEntitySet >> colorS: aColor [
	"Purpose: for each element of the surround, changes background color to a given color (to draw observer attention to the surround)
Argument: aColorSymbol = <ByteSymbol>
Example: self colorS: #pink"
	
	self surround isNil ifFalse: [self surround do: [:v | v color: aColor]]
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> components [
	"collection of constituent elements"
	
	^components ifNil: [components := OrderedCollection new]
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> components: aList [
	
	aList
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: self].
	components := aList
]

{ #category : #'- testing' }
CMSpatialEntitySet >> containsCell: aCell [
	"Purpose: "
	
	self components isEmpty ifTrue: [^false].
	(self at: 1) isElementary
		ifTrue: [^self components includes: aCell]
		ifFalse: [^self components containsCell: aCell]	"!! recursiv"
]

{ #category : #'star testing' }
CMSpatialEntitySet >> delete [
	"Purpose: gets rid of this object. The collectGarbage is IMMEDIATELY performed  (ie. the receiver of class X is removed from 'theXXXs' collection)"

	self components isEmpty
		ifFalse: [ self deleteComponents: self components ].
	self
		reset;
		destroyed: true.
	self collector isNil
		ifFalse: [ self collector removeEntity: self ].
	self cormasModel
		registerEntityChange: #removeEntity
		from: (EntityReference on: self)
]

{ #category : #'- control' }
CMSpatialEntitySet >> deleteComponent: anItem [
	"Purpose: removes a given component and notifies the change to dependents
Argument: anItem = <SpatialEntity>"
	
	self components
		remove: anItem
		ifAbsent: [].
	anItem compoundSpatialClasses
		at: self class name
		put: nil
]

{ #category : #'- control' }
CMSpatialEntitySet >> deleteComponents: aCollec [
	"Purpose: removes a given collection of components and notifies the change to dependents
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"
	
	self components: self components - aCollec.
	aCollec
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: nil]
]

{ #category : #'- initialize-release' }
CMSpatialEntitySet >> destroyed: aBoolean [
	"for the moment, it is a non destructive method for the components. "
	
	Dev todo: 'To be changed ?'.
	super destroyed: aBoolean
]

{ #category : #'- obsolete' }
CMSpatialEntitySet >> displayString: aString [
	
	| x y |
	x := self components asOrderedCollection first center x.
	y := self components asOrderedCollection first center y.
	self view graphicsContext
		displayString: aString
		at: x @ y
]

{ #category : #'+ environment - distance' }
CMSpatialEntitySet >> distanceTo: aSpatialEntity [
	"Purpose: returns the Manhattan distance (in cells) between the receiver and aSpatialEntity
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Integer>"
	
	| sortColl |
	sortColl := SortedCollection new.
	self components
		do: [:aComponent | sortColl add: (aComponent distanceTo: aSpatialEntity)].
	^sortColl first
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> elementaryComponents [
	"Purpose: returns the elementary components. 
Use to collect the components of components when the receiver is an aggregate of aggregates"
	
	| allComponents |
	^((self at: 1) class inheritsFrom: CMSpatialEntityElement)
		ifTrue: [self components]
		ifFalse:
			[allComponents := OrderedCollection new.	"recursif method"
			self components do: [:c | allComponents addAll: c elementaryComponents].
			^allComponents]
]

{ #category : #'+ environment - distance' }
CMSpatialEntitySet >> euclideanDistanceTo: aSpatialEntity [
	"Purpose: returns the distance between the receiver and a given spatial entity, using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Number>"
	
	| sortColl |
	sortColl := SortedCollection new.
	self components
		do:
			[:aComponent | sortColl add: (aComponent euclideanDistanceTo: aSpatialEntity)].
	^sortColl first
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> externalSurround [
	"Returns a collection of cells that surround the aggregate, WITHOUT included cells located into the aggregate"
	
	| allSurrounds linkedCells edgeCells externalSurround |
	self internalLines isEmpty ifTrue: [^self surround].
	allSurrounds := self surround
		asSortedCollection: [:c1 :c2 | c1 id < c2 id].	"on test si il y a des files de cellules en contact avec le bord"
	linkedCells := self getLinkedCellsOf: allSurrounds.
	edgeCells := linkedCells select: [:coll | coll contains: [:c | c edge]].
	edgeCells isEmpty
		ifTrue: [^linkedCells first]
		ifFalse:
			[externalSurround := OrderedCollection new.
			edgeCells do: [:coll | externalSurround addAll: coll]].
	^externalSurround
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> getEpidermis [
	"Purpose: returns the components belonging to the inner perimeter, i.e. components of the receiver with at least one neighbour not component of the receiver
Return value: <Collection(SpatialEntity)>"
	
	^self getSkins first
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> getLinkedCellsOf: aCollectionOfCells [
	"returns a collection of collections. Each subcollection contains connected cells"
	
	| bigColl allCells subColl coll |
	bigColl := OrderedCollection new.
	allCells := aCollectionOfCells copy.
	subColl := OrderedSet new.
	[allCells isEmpty]
		whileFalse:
			[subColl isEmpty ifTrue: [subColl add: allCells first].
			coll := (self neighborsOf: subColl) select: [:n | allCells includes: n].
			coll isEmpty
				ifFalse: [subColl addAll: coll]
				ifTrue:
					[bigColl add: subColl.
					allCells removeAll: subColl.
					subColl := OrderedSet new]].
	^bigColl
]

{ #category : #'- displaying' }
CMSpatialEntitySet >> getPovSpecWithComponentsForSelector: selectorName andInfo: aInfoName [
	"Returns the Pov Spec for a pov selectorName and a infoName "
	
	| spec |
	spec := EntityPOVSpec new.
	spec povSelector: selectorName.
	spec povResult: (self getPovResultFor: selectorName).
	spec infoName: aInfoName.
	spec infoResult: (self getInfoFor: aInfoName).
	spec
		elementaryComponentsId: (self elementaryComponents collect: [:e | e id]).
	^spec
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> idsWithSeparator: aChar [
	"Purpose: returns the id of receiver and all the id of the components
Argument: aChar = <Character>
ReturnValue: <ByteString>"
	
	| string |
	string := self id printString , aChar asSymbol asString
		, self components size printString.
	self components
		do: [:i | string := string , aChar asSymbol asString , i id printString].
	^string
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> internalLines [
	"Returns a collection containing the internal contours of this spatialEntity. 
For example, a ring-like aggregate will return a collection with 1 polyline, when an 8-like aggregate will returns 2 polylines"

	^ self defaultPOV internalLines
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> internalSurrounds [
	"Returns a collection of internal cells that surround the aggregate (only the cells located into the aggregate)"
	
	| allSurrounds linkedCells edgeCells |
	allSurrounds := self surround
		asSortedCollection: [:c1 :c2 | c1 id < c2 id].	"on r√©cup√®re des files de cellules connect√©es"
	linkedCells := self getLinkedCellsOf: allSurrounds.	"on test si il y a des files de cellules en contact avec le bord"
	edgeCells := linkedCells select: [:coll | coll contains: [:c | c edge]].
	edgeCells isEmpty
		ifTrue: [linkedCells removeFirst]
		ifFalse: [linkedCells removeAll: edgeCells].
	^linkedCells
]

{ #category : #'- testing' }
CMSpatialEntitySet >> isCrossedByArc: anArc [
	"answer if the Aggregate is crossed by anArc"
	
	| arcLine |
	self halt.	"does not work anymore. an ESE does not know directly it bounds."
	arcLine := LineSegment
		from: anArc startCell center
		to: anArc stopCell center.
	self components
		do: [:c | (arcLine outlineIntersects: c bounds) ifTrue: [^true]].
	^false
]

{ #category : #'- testing' }
CMSpatialEntitySet >> isElementary [
	
	^false
]

{ #category : #'+ testing' }
CMSpatialEntitySet >> isSpatialEntitySet [
	
	^true
]

{ #category : #'- displaying' }
CMSpatialEntitySet >> joinSegments: aCollecOfLineSegments [
	"clp juin 2000"
	"Prend en parametre une collection de LineSegments et
retourne la collection des noeuds de la ligne brisee"
	
	| vertices firstSegment segment |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	[segment end = firstSegment start]
		whileFalse:
			[segment := aCollecOfLineSegments
				detect: [:s | s start = segment end]
				ifNone: [nil].
			segment isNil not
				ifTrue:
					[vertices add: segment end.
					aCollecOfLineSegments remove: segment]
				ifFalse: [self halt]].
	^vertices
]

{ #category : #'- obsolete' }
CMSpatialEntitySet >> keepImageAndAddComponent: cell [
	"Purpose: silently adds a given component (do not notify the change to dependents)
Argument: aSpatialEntity = <SpatialEntity>"
	
	self addSilentlyComponent: cell
]

{ #category : #'- obsolete' }
CMSpatialEntitySet >> keepImageAndAddComponents: aCollec [
	"Purpose: silently adds a given set of components (do not notify the change to dependents)
Argument: aCollec = <Collection(SpatialEntity)>"
	
	self addSilentlyComponents: aCollec
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntitySet >> nearestCellVerifying: aBlock1 constraintOnPath: aBlock2 [
	"Purpose: returns the nearest cell verifying a specified condition1, the cells in between verifying another specified condition2.
Arguments: condition1 = <BlockClosure>
			condition2 = <BlockClosure>
Return value: <SpatialEntity | nil>
Example := self nearestCellVerifying: [:aCell | aCell hasWater] constraintOnPath: [:aCell | aCell isClosed not]"
	
	| collec target minimum d |
	collec := self spaceModel elementaryEntities
		select: [:c | aBlock1 value: c].
	collec ifNil: [^nil].
	target := collec first.
	minimum := self surround first shortestDistanceTo: target
		constraintOnPath: aBlock2.
	collec
		do:
			[:c | 
			self surround
				do:
					[:cs | 
					d := cs shortestDistanceTo: c constraintOnPath: aBlock2.
					d = 0 ifTrue: [^c].
					d < minimum
						ifTrue:
							[minimum := d.
							target := c]]].
	^target
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> neighborsOf: aCollectionOfCells [
	"returns a collection of cells that all are neighbors of each element of aCollectionOfCells"
	
	| neighbors |
	neighbors := OrderedCollection new.
	aCollectionOfCells do: [:cell | neighbors addAll: cell neighbourhood].
	^OrderedSet withAll: neighbors - aCollectionOfCells
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> outline [
	" return a Polyline arround the spatialEntity"
	
	^outline ifNil: [outline := self defaultPOV outline]
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> receiveComponent: x fromEntity: y [
	"Purpose: performs an exchange of component among the receiver and another spatial entity made of same kind of lower level spatial entities
Arguments: x = <SpatialEntity>
			y = <SpatialEntitySet>"
	
	y removeComponent: x.
	self addComponent: x
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> receiveComponents: aCollec fromEntity: y [
	"Purpose: performs an exchange of components among the receiver and another spatial entity made of same kind of lower level spatial entities
Arguments: aCollec = <Collection(SpatialEntity)>
			y = <SpatialEntitySet>"
	
	y removeComponents: aCollec.
	self addComponents: aCollec
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> receiveOneSurroundingComponentFromEntity: y [
	"Purpose: performs an exchange of component among the receiver and another spatial entity made of same kind of lower level spatial entities
The two spatial entities have to be neighbours.
The component for the exchange is selected according to the neighbourhood coherence principle
Arguments: y = <SpatialEntitySet>"
	
	| potentialComponents winner |
	potentialComponents := self surround
		select: [:c | y components includes: c].
	potentialComponents isEmpty
		ifFalse:
			[potentialComponents := potentialComponents
				asSortedCollection: [:i :j | (i nciAbout: y) < (j nciAbout: y)].
			potentialComponents := potentialComponents
				select:
					[:c | (c nciAbout: y) = (potentialComponents first nciAbout: y)].
			winner := Cormas selectRandomlyFrom: potentialComponents.
			self receiveComponent: winner fromEntity: y].
	^winner
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> removeComponent: anItem [
	"Purpose: removes a given component and notifies the change to dependents
Argument: anItem = <SpatialEntity>"

	self deleteComponent: anItem.
	self components isEmpty
		ifFalse: [ self cormasModel
				registerEntityChange: #compositionChanged
				with: (EntityReference onEntities: self components)
				from: (EntityReference on: self) ]
		ifTrue: [ self delete.
			self cormasModel
				registerEntityChange: #removeEntity
				from: (EntityReference on: self) ]
]

{ #category : #'+ components - managing' }
CMSpatialEntitySet >> removeComponents: aCollec [
	"Purpose: removes a given collection of components and notifies the change to dependents
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"

	self deleteComponents: aCollec.
	self components isEmpty
		ifFalse: [ self cormasModel
				registerEntityChange: #compositionChanged
				with: (EntityReference onEntities: self components)
				from: (EntityReference on: self) ]
		ifTrue: [ self delete ]
]

{ #category : #'+ initialize-release' }
CMSpatialEntitySet >> reset [
	"super reset."
	"-> il ne faut pas faire un super reset sinon ca envoi un leave √† allOccupants"
	"on reprend donc du coup les appellent d''un reset en ometant le initOcc"
	
	request := nil.
	self resetFlag.
	theCSE := nil.
	includedEntities := nil.
	components := nil.
	type := #unknow.
	outline := nil
]

{ #category : #'- displaying' }
CMSpatialEntitySet >> setDelimitors [
	"outline = external Polyline.
internalLines  = collection of Polylines. nbSegments lineWidth "
	
	| segments duplicates |
	segments := OrderedCollection new.
	self components
		do:
			[:aPov | aPov outline edgesDo: [:i :j | segments add: (LineSegment from: i to: j)]].	"Lines with equal endpoints but opposite directions will be also removed"
	duplicates := Set new.
	segments
		do:
			[:seg1 | 
			segments
				do:
					[:seg2 | 
					seg1 == seg2
						ifFalse:
							[seg1 = seg2
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2].
							seg1
								=
									(LineSegment
										from: seg2 end
										to: seg2 start)
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2]]]].
	segments
		do:
			[:seg1 | 
			segments
				do:
					[:seg2 | 
					seg1 == seg2
						ifFalse:
							[((seg1 start = seg2 start and: [seg1 end = seg2 end])
								or:
									[(seg1 start = seg2 end and: [seg1 end = seg2 start])
										or: [seg1 end = seg2 start and: [seg1 start = seg2 end]]])
								ifTrue:
									[duplicates
										add: seg1;
										add: seg2]]]].
	segments removeAll: duplicates
]

{ #category : #'- initialize-release' }
CMSpatialEntitySet >> setSurround [
	"Returns a collection of cells that surround the aggregate, including the cells located into the aggregate"
	"Faut dire c'qui est, c'est du brutal !
	Met a jour et retourne l'attribut surround = une collection de cellules externes qui bordent l'agregat"
	
	| ens ensVoisins |
	ens := Set new.
	ensVoisins := Set new.
	ens addAll: self components.
	self components do: [:cell | ensVoisins addAll: cell neighbourhood].
	self surround: (OrderedCollection withAll: ensVoisins - ens).
	^surround
]

{ #category : #'+ environment - distance' }
CMSpatialEntitySet >> shortestDistanceToCells: aCollecOfCells constraintOnPath: aBlock [
	"Purpose: gets the shortest distance (in cell unit) to a collection of other cells, taking a specified constraint into account.
Arguments: aCollecOfCells = <Collection(SpatialEntityElement)>
			aBlock = <BlockClosure>
Return value: <Integer>
Example: self shortestDistanceToCells: self myPlots constraintOnPath: [:aCell | aCell isClosed not]"
	
	^self
		distanceTo:
			(self nearestCellFromCells: aCollecOfCells constraintOnPath: aBlock)
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> size [
	
	^self components size
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> surface [
	
	^self size
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> surround [
	"Returns a collection of cells that surround the aggregate, including the cells located into the aggregate"
	
	^surround ifNil: [surround := self setSurround]
]

{ #category : #'- accessing' }
CMSpatialEntitySet >> surround: aCollectionOfCells [
	"aCollectionOfCells <aCollection of SpatialEntityElements>"
	
	surround := aCollectionOfCells
]

{ #category : #'- obsolete' }
CMSpatialEntitySet >> swell [
	"The aggregat swells on its surround layer. It swells if there is enough space arround it.
Returns a boolean indicating if it has spread"
	
	| newCells |
	newCells := self surround select: [:c | (c isComponentOf: self class) not].	"newCells := Cormas selectRandomlyFrom: newCells subCollectionSize: nbOfNewCells."
	newCells isEmpty ifTrue: [^false].
	self addComponents: newCells.
	self setSurround.
	^true
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> theOccupants [
	"redefined to collect the occupants registered in all the components"
	
	theOccupants := Dictionary new.
	self components
		do:
			[:cellOrAggregate | 
			cellOrAggregate theOccupants
				keysAndValuesDo:
					[:k :collec | 
					(theOccupants
						at: k
						ifAbsentPut: [OrderedCollection new]) addAll: collec]].
	^theOccupants
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> type [
	"descriptor"
	
	^type ifNil: [type := #unknow]
]

{ #category : #'+ accessing' }
CMSpatialEntitySet >> type: something [
	
	type := something
]

{ #category : #'+ environment - sensing - space' }
CMSpatialEntitySet >> wayTo: aSpatialEntity [
	"Purpose: gets the shortest way to another spatial entity
Argument: aSpatialEntity = <SpatialEntity>
Return value: <Collection(SpatialEntity)>
Example: self wayTo: self spaceModel centralLocation"
	
	| path path2 |
	aSpatialEntity isSpatialEntityElement
		ifTrue: [^self wayToCell: aSpatialEntity].
	path := self surround first wayTo: aSpatialEntity surround first.
	self surround
		do:
			[:cell | 
			path2 := aSpatialEntity wayToCell: cell.
			path2 size < path ifTrue: [path := path2]].
	^path
]

{ #category : #'- environment - sensing - space' }
CMSpatialEntitySet >> wayToCell: aCell [
	"Purpose: returns one of the shortest paths to aCell
Argument: aCell = <SpatialEntityElement>
Return value: <Collection(SpatialEntityElement)>
Example: self wayTo: self spaceModel centralLocation"
	
	| path path2 |
	path := self surround first wayTo: aCell.
	self surround
		do:
			[:c | 
			path2 := c wayTo: aCell.
			path2 size < path ifTrue: [path := path2]].
	^path
]
