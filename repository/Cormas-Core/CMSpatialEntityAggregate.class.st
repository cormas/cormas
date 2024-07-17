"
Instance Variables:
	compactness	<Float>  4* pi *area / perimeter squared
	givenSize	<Integer>  fixed number of components

"
Class {
	#name : #CMSpatialEntityAggregate,
	#superclass : #CMSpatialEntitySet,
	#instVars : [
		'compactness',
		'givenSize'
	],
	#category : 'Cormas-Core-Entities'
}

{ #category : #metrics }
CMSpatialEntityAggregate >> compactness [
	"(4* pi *area / perimeter squared)"
	
	^compactness
]

{ #category : #accessing }
CMSpatialEntityAggregate >> compactness: uneValeur [
	
	compactness := uneValeur
]

{ #category : #'components - managing' }
CMSpatialEntityAggregate >> deleteComponents: aCollec [
	"Purpose: removes a given set of components and tests if some components have effectively been removed before computing the surround again
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"
	
	| initialSize |
	initialSize := self components size.	"aCollec do: [:c | self components remove: c ifAbsent: []]."	"NB 2014-04-11->previous line replaced by the following because some elements are not removed with the previous method"
	self components: (self components difference: aCollec).
	aCollec
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: nil].
	initialSize ~= self components size ifTrue: [self setSurround]
]

{ #category : #obsolete }
CMSpatialEntityAggregate >> displaySegment: aDirection [
	
	| readAccessSelector aGC |
	aGC := self graphicsContext.
	aGC paint: #black.
	readAccessSelector := ('lineSegment' , aDirection) asSymbol.
	(self perform: readAccessSelector) notNil
		ifTrue: [(self perform: readAccessSelector) displayStrokedOn: aGC]
]

{ #category : #deprecated }
CMSpatialEntityAggregate >> distSurroundAggregatePixel: anAg [
	"Deprecated"
	
	| distMin dist |
	distMin := (self at: 1) distCenter: (anAg at: 1).
	self surround
		do:
			[:a | 
			anAg surround
				do:
					[:b | 
					dist := a distCenter: b.
					dist < distMin ifFalse: [distMin := dist]]].
	^distMin
]

{ #category : #accessing }
CMSpatialEntityAggregate >> getEndodermis [
	"Returns a collection of collections of cells belonging to the 'endodermis skin' of the aggregate"
	
	| collections |
	collections := self getSkins removeFirst.
	^collections
]

{ #category : #deprecated }
CMSpatialEntityAggregate >> getSkin [
	"clp feb 2001"
	"renvoie les cellules en lisiere interne"
	
	^self components
		select:
			[:c | 
			(c neighbourhood contains: [:n | (self components includes: n) not])
				or: [c edge]]
]

{ #category : #accessing }
CMSpatialEntityAggregate >> getSkinE [
	"Returns a collection of cells belonging to the 'internal skin' of the aggregate"
	
	| elementaryComponents |
	elementaryComponents := self elementaryComponents.
	^elementaryComponents
		select:
			[:c | 
			(c neighbourhood contains: [:n | (elementaryComponents includes: n) not])
				or: [c edge]]
]

{ #category : #deprecated }
CMSpatialEntityAggregate >> getSkinNew [
	"clp feb 2001"
	"renvoie les cellules en lisiere interne"
	
	^self components
		select:
			[:c | c neighbourhood contains: [:n | (self components includes: n) not]]
]

{ #category : #deprecated }
CMSpatialEntityAggregate >> getSkinOld [
	"clp mars 2000"
	"renvoie les cellules en lisiere interne"
	
	^self components
		select:
			[:c | 
			(c neighbourhood select: [:n | self components includes: n]) size
				< c neighbourhood size]
]

{ #category : #accessing }
CMSpatialEntityAggregate >> getSkins [
	"Returns a collection of collections of connected cells belonging 
	to the 'internal skin' of the aggregate"
	"The first coll contains the 'first' cell of the aggregat, ie. the top left cell"
	
	| sortedCells allSkins aColl aCell includedNeighCells |
	sortedCells := (self getSkinE asSortedCollection: [:a :b | a id < b id])
		copy.
	allSkins := OrderedCollection new.
	[sortedCells isEmpty]
		whileFalse:
			[aColl := OrderedCollection new.
			aCell := sortedCells first.
			includedNeighCells := OrderedCollection with: aCell.
			[includedNeighCells isEmpty or: [sortedCells isEmpty]]
				whileFalse:
					[aCell := sortedCells first.
					aColl add: aCell.
					sortedCells remove: aCell.
					includedNeighCells := aCell neighbourhood
						select: [:n | sortedCells includes: n].
					aColl addAll: includedNeighCells.
					sortedCells removeAll: includedNeighCells].
			allSkins add: aColl].
	^allSkins
]

{ #category : #accessing }
CMSpatialEntityAggregate >> givenSize [
	"Purpose: stores the target size.
by default, a very large givenSize"
	
	^givenSize isNil
		ifTrue: [999999999999]
		ifFalse: [givenSize]
]

{ #category : #accessing }
CMSpatialEntityAggregate >> givenSize: aValue [
	
	givenSize := aValue
]

{ #category : #'initialize-release' }
CMSpatialEntityAggregate >> initNeighbourhood [
	"Purpose: builds and store the neighbourhood of the receiver as the collection of same kind of aggregates whose components include at least one element the receiver surround"
	
	self edge: (self components contains: [:c | c edge]).
	self setSurround.
	neighbourhoodWithNils := (surround
		collect:
			[:a | 
			a theAggregates
				at: self class name
				ifAbsent: [nil]]) asSet.	"To get rid of duplicates, a Set is used..."
	neighbourhoodWithNils := neighbourhoodWithNils asOrderedCollection	"...and then made as an OrderedCollection once the job is done..."
]

{ #category : #displaying }
CMSpatialEntityAggregate >> joinSegments: aCollecOfLineSegments [
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

{ #category : #displaying }
CMSpatialEntityAggregate >> joinSegments_PB: aCollecOfLineSegments [
	"clp juin 2000, revu PB Fev 2002"
	"Prend en parametre une collection de LineSegments et 
	retourne la collection des noeuds de la ligne brisee"
	
	| vertices firstSegment segment endLoop |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	endLoop := false.
	["[segment end = firstSegment start] whileFalse: ds le cas de la connexite = 8 il faut aussi verifier que 'firstSegment start' est un point qui n'appartient pas a d'autres segments. correction PB"
	endLoop]
		whileFalse:
			[segment := aCollecOfLineSegments
				detect: [:s | s start = segment end]
				ifNone: [nil].
			segment isNil not
				ifTrue:
					[vertices add: segment end.
					aCollecOfLineSegments remove: segment]
				ifFalse: [self halt].
			endLoop := segment end = firstSegment start	"and: [(aCollecOfLineSegments contains: [:s | s start = segment end]) not]"].
	^vertices
]

{ #category : #'components - managing' }
CMSpatialEntityAggregate >> mergeWith: otherAggregate [
	"Purpose: merges a givern aggregate with the receiver whose surround is then reset
Argument: otherAggregate = <SpatialEntityAggregate>"
	
	self components addAll: otherAggregate components.
	self setSurround
]

{ #category : #metrics }
CMSpatialEntityAggregate >> perimeter [
	"return the number of segments of the skin"
	
	| counter nb |
	counter := 0.
	self outline isEmpty ifTrue: [self setOutline].
	self outline
		do:
			[:a | 
			"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
			nb := a at: 2.
			self spaceModel gridCellShape = #hexagonal
				ifTrue: [counter := counter + nb size]
				ifFalse:
					[nb
						do:
							[:e | e = #S | (e = #N) | (e = #E) | (e = #W) ifTrue: [counter := counter + 1]]]].
	^counter
]

{ #category : #displaying }
CMSpatialEntityAggregate >> segment: direction from4: segments [
	"Selon la m√©thode de fabrication d'une image rectangulaire (cf createTopLeftRectangularCellImage), on a l'ordre suivant:
                 1
		#######
	4	#         #   2
		#######
		     3
"
	
	(direction = #NE
		or: [direction = #NW or: [direction = #SW or: [direction = #SE]]])
		ifTrue: [^nil].
	direction = #N ifTrue: [^segments first].
	direction = #E ifTrue: [^segments at: 2].
	direction = #S ifTrue: [^segments at: 3].
	direction = #W ifTrue: [^segments last]
]

{ #category : #displaying }
CMSpatialEntityAggregate >> segment: direction from6: segments [
	"Selon la m√©thode de fabrication d'une image hexagonale (cf createTopLeftHexagonalCellImage), on a l'ordre suivant:
			    #
	  3       #         #      4
		#                  #	
	2	#                  #    5
		#                  #
		1    #         #   6  
			     #      
"
	
	(direction = #N or: [direction = #S]) ifTrue: [^nil].
	direction = #SW ifTrue: [^segments first].
	direction = #W ifTrue: [^segments at: 2].
	direction = #NW ifTrue: [^segments at: 3].
	direction = #NE ifTrue: [^segments at: 4].
	direction = #E ifTrue: [^segments at: 5].
	direction = #SE ifTrue: [^segments last]
]

{ #category : #displaying }
CMSpatialEntityAggregate >> setOutline [
	"clp mars 2000"
	
	| directions |
	"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
	self outline: Set new.
	self getSkinE do: [:c | 
		directions := Set new.
		directions addAll: c boundaryDirections.
		c neighbourhood
			select: [:cc | (self elementaryComponents includes: cc) not]
			thenDo: [:on | directions add: (c directionNeighbour: on) ].

		self outline add: (Array with: c id with: directions) ].
	^ outline
]

{ #category : #displaying }
CMSpatialEntityAggregate >> setOutline2 [
	"clp mars 2000 - PB mai 2002"
	"Pour les cells regulieres : outline est une collection de couples 
	de valeurs (id de cellule; 
	collection de directions) 
	Pour les cells irregulieres: outine est une collection de points"
	
	| directions includedNeighCells outlineTempo |
	self outline: Set new.
	self getSkinE
		do:
			[:c | 
			self spaceModel gridCellShape = #irregular
				ifTrue:
					[outlineTempo := c outline copy asSet.
					includedNeighCells := c neighbourhood
						select: [:n | self containsCell: n].
					includedNeighCells do: [:n | outlineTempo := outlineTempo - n outline].
					self outline addAll: outlineTempo]
				ifFalse:
					[directions := Set new.
					directions addAll: c boundaryDirections.
					(c neighbourhood
						select: [:cc | (self elementaryComponents includes: cc) not])
						do: [:on | directions add: (c directionNeighbour: on)].
					self outline
						add:
							(Array
								with: c id
								with: directions)]]
]

{ #category : #displaying }
CMSpatialEntityAggregate >> setOutline3 [
	"outine est une collection de points"
	
	| externalNeighCells outlineTempo skin |
	self outline: OrderedCollection new.
	outlineTempo := Set new.
	skin := self getSkinE.
	skin
		do:
			[:cell | 
			externalNeighCells := cell neighbourhood
				select: [:n | (self elementaryComponents includes: n) not].
			externalNeighCells
				do: [:n | outlineTempo addAll: (cell sharedOutlineWith: n)]].
	self outline addAll: outlineTempo.
	self outline add: (self outline at: 1)
]

{ #category : #control }
CMSpatialEntityAggregate >> swell [
	"The aggregat swells on its surround layer. It swells if there is enough space arround it and if its size is below givenSize.
	Returns a boolean indicating if it has spread"
	
	| newCells |
	givenSize ifNil: [^super swell].
	self components size >= givenSize ifTrue: [^false].
	newCells := self surround select: [:c | (c isComponentOf: self class) not].	"newCells := Cormas selectRandomlyFrom: newCells subCollectionSize: nbOfNewCells."
	newCells isEmpty ifTrue: [^false].
	self components size + newCells size >= givenSize
		ifTrue:
			[newCells := Cormas
				selectRandomlyFrom: newCells
				subCollectionSize: givenSize - self components size].
	self addComponents: newCells.
	^true
]

{ #category : #metrics }
CMSpatialEntityAggregate >> updateCompactness [
	"Purpose: computes and stores the compactness index of the receiver (4* pi *area / perimeter squared)
Return value: <Float>"
	
	| p |
	p := self perimeter.
	self
		compactness:
			(p = 0
				ifTrue: [0]
				ifFalse: [4 * Float pi * self size / p squared]).
	^self compactness
]
