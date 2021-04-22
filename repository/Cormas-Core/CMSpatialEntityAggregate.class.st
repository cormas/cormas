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
	#category : #'Cormas-Core-Entities'
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

{ #category : #obsolete }
CMSpatialEntityAggregate >> connexityTest [
	"teste si les cellules de l' agreg (self) sont ttes connexes: a partir d'une cellule quelconque de l'agreg, la procedure determine un Agregat (agreg2). 
Retourne la liste des cells de l'agreg qui n'appartiennent pas a agreg2. Si cette liste est vide = ok"
	
	| agreg2 listeVoisins listTempo test agreg1 |
	test := OrderedCollection new.
	agreg1 := Set new.
	agreg1 addAll: self components.
	agreg1 do: [:c | c flag: false].
	agreg2 := Set new.
	agreg2 add: ((self at: 1) flag: true).
	listeVoisins := agreg2.
	[listeVoisins isEmpty]
		whileFalse:
			[listTempo := Set new.
			listeVoisins
				do:
					[:cell | 
					listTempo
						addAll:
							(cell neighbourhood
								select: [:v | (agreg1 includes: v) and: [v flag = false]])].
			listeVoisins := listTempo.
			listeVoisins do: [:c | c flag: true].
			agreg2 addAll: listeVoisins].
	agreg2 do: [:c | c flag: false].	"tester uniquement sur la taille ne suffit pas :"
	test := agreg1 - agreg2.
	^test
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
				< c orderedNeighbourhood size]
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

{ #category : #obsolete }
CMSpatialEntityAggregate >> imageIncludes: aPoint [
	
	^self image notNil
		ifTrue: [self image component regionIntersects: (aPoint extent: 1)]
		ifFalse: [false]
]

{ #category : #'initialize-release' }
CMSpatialEntityAggregate >> initNeighbourhood [
	"Purpose: builds and store the neighbourhood of the receiver as the collection of same kind of aggregates whose components include at least one element the receiver surround"
	
	self edge: (self components contains: [:c | c edge]).
	self setSurround.
	neighbourhood := (surround
		collect:
			[:a | 
			a theCSE
				at: self class name
				ifAbsent: [nil]]) asSet.	"To get rid of duplicates, a Set is used..."
	neighbourhood := neighbourhood asOrderedCollection	"...and then made as an OrderedCollection once the job is done..."
]

{ #category : #displaying }
CMSpatialEntityAggregate >> joinSegments2: aCollecOfLineSegments [
	"clp juin 2000, revu PB Fev 2002"
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
CMSpatialEntityAggregate >> joinSegments3: aCollecOfLineSegments [
	"clp juin 2000, revu PB Fev 2002"
	"Prend en parametre une collection de LineSegments et 
	retourne la collection des noeuds de la ligne brisee"
	" !! Recursive !!"
	
	| vertices firstSegment segment segments |
	vertices := OrderedCollection new.
	firstSegment := aCollecOfLineSegments first.
	segment := firstSegment.
	vertices
		add: segment start;
		add: segment end.
	aCollecOfLineSegments remove: segment.
	[segment end = firstSegment start or: [aCollecOfLineSegments isEmpty]]
		whileFalse:
			[segments := aCollecOfLineSegments select: [:s | s start = segment end].
			segment := segments at: 1.
			vertices add: segment end.
			aCollecOfLineSegments remove: segment	"segments size > 1 ifTrue: [^vertices addAll: (self joinSegments: aCollecOfLineSegments)]"].
	aCollecOfLineSegments isEmpty
		ifTrue: [^vertices]
		ifFalse:
			[vertices addAll: (self joinSegments: aCollecOfLineSegments).
			^vertices]	" !! Recursive !!"
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

{ #category : #obsolete }
CMSpatialEntityAggregate >> setImage [
	
	| p segments vertices newSegment thePolylines mainPolyline ie |
	self setOutline.
	self outline isNil not
		ifTrue:
			["Recuperation de tous les segments"
			segments := OrderedCollection new.
			self outline
				do:
					[:c | 
					p := self spaceModel elementaryEntities
						detect: [:cc | cc id = c first]
						ifNone: [self halt].
					c last
						do:
							[:dir | 
							newSegment := p perform: ('lineSegment' , dir asString , 'f') asSymbol.
							newSegment isNil ifFalse: [segments add: newSegment]]].	"Il faut ensuite les recoudre...pour creer les vertices des polylines"
			thePolylines := OrderedCollection new.
			[segments isEmpty]
				whileFalse:
					[vertices := self joinSegments: segments.
					(vertices isNil not and: [vertices isEmpty not])
						ifTrue: [thePolylines add: (Polyline vertices: vertices)]].	"Creation de l'image, mise a jour affichage si necessaire"
			thePolylines isEmpty
				ifFalse:
					[thePolylines := thePolylines
						asSortedCollection: [:a :b | a vertices size > b vertices size].
					mainPolyline := thePolylines first.
					thePolylines remove: mainPolyline.
					self image: mainPolyline asFiller.
					self center: (self at: 1) center.	"le centre de l'agregat correspond au centre du 1er element"
					self includedEntities: Set new.
					thePolylines
						do:
							[:polyL | 
							ie := self class new: self spaceModel.
							ie image: polyL asFiller.
							self includedEntities add: ie]]]
]

{ #category : #obsolete }
CMSpatialEntityAggregate >> setImage2 [
	
	| p segments vertices newSegment thePolylines mainPolyline |
	self setOutline.
	self spaceModel gridCellShape = #irregular
		ifTrue: [^self setImageFromIrregularCells].	"Recuperation de tous les segments"
	self outline isNil not
		ifTrue:
			[segments := OrderedCollection new.
			self outline
				do:
					[:c | 
					p := self view model elementaryEntities at: c first.
					c last
						do:
							[:dir | 
							newSegment := p perform: ('lineSegment' , dir asString , 'f') asSymbol.
							newSegment isNil ifFalse: [segments add: newSegment]]].	"Il faut ensuite les recoudre...pour creer les vertices des polylines"
			thePolylines := OrderedCollection new.
			[segments isEmpty]
				whileFalse:
					[vertices := self joinSegments: segments.
					(vertices isNil not and: [vertices isEmpty not])
						ifTrue: [thePolylines add: (Polyline vertices: vertices)]].	"Creation de l'image, mise a jour affichage si necessaire"
			thePolylines isEmpty
				ifFalse:
					[thePolylines := thePolylines
						asSortedCollection: [:a :b | a vertices size > b vertices size].
					mainPolyline := thePolylines first.
					thePolylines remove: mainPolyline.	"Controle si le mainPolyline ne contient pas d'autres polylines (cas connexite = 8)"	"Marche pas trop ! Voir avec example de Geometric :
	comp := CompositePart new.
	comp add: g1. <Wapper>
	comp add: g2.
	win component: (BoundedWrapper on: comp)."
					thePolylines isEmpty
						ifFalse:
							[| extension |
							extension := thePolylines.
							[extension isEmpty]
								whileFalse:
									[extension := Set new.
									thePolylines
										do:
											[:pol | 
											pol
												verticesDo:
													[:pt | 
													(mainPolyline vertices contains: [:ptm | ptm = pt])
														ifTrue: [extension add: pol]]].
									extension
										do:
											[:poly | 
											| v |
											v := mainPolyline vertices asOrderedCollection.
											v addAll: poly vertices.
											mainPolyline := Polyline vertices: v.
											thePolylines remove: poly]]].
					self includedEntities: Set new.
					self image: mainPolyline.	"le centre de l'agregat correspond au centre du 1er element"
					self center: (self at: 1) center.
					self includedEntities addAll: thePolylines]]
]

{ #category : #obsolete }
CMSpatialEntityAggregate >> setImage3 [
	
	| p segments vertices newSegment thePolylines mainPolyline directions includedNeighCells |
	self spaceModel gridCellShape = #irregular
		ifTrue: [^self setImageFromIrregularCells].
	directions := Set new.
	self getSkinE
		do:
			[:cell | 
			"im := cell image component translatedBy: cell center.
			cell view model delimiter ifTrue: [d := 1] ifFalse: [d := 0].
			^LineSegment from: (im bottomRight translatedBy: d @ d)
				to: (im bottomLeft translatedBy: 0 @ d)"
			"directions := cell boundaryDirections copy asSet.
				includedNeighCells := cell neighbourhood select: [:n | self containsCell: n].
				includedNeighCells do: [:n | directions := directions - n boundaryDirections].
				self outline addAll: directions"
			directions := Set new.
			directions addAll: cell boundaryDirections.
			(cell neighbourhood
				select: [:cc | (self elementaryComponents includes: cc) not])
				do: [:on | directions add: (cell directionNeighbour: on)].
			self outline
				add:
					(Array
						with: cell id
						with: directions)].	"Recuperation de tous les segments"
	self outline isNil not
		ifTrue:
			[segments := OrderedCollection new.
			self outline
				do:
					[:c | 
					p := self view model elementaryEntities at: c first.
					c last
						do:
							[:dir | 
							newSegment := p perform: ('lineSegment' , dir asString , 'f') asSymbol.
							newSegment isNil ifFalse: [segments add: newSegment]]].	"Il faut ensuite les recoudre...pour creer les vertices des polylines"
			thePolylines := OrderedCollection new.
			[segments isEmpty]
				whileFalse:
					[vertices := self joinSegments: segments.
					(vertices isNil not and: [vertices isEmpty not])
						ifTrue: [thePolylines add: (Polyline vertices: vertices)]].	"Creation de l'image, mise a jour affichage si necessaire"
			thePolylines isEmpty
				ifFalse:
					[thePolylines := thePolylines
						asSortedCollection: [:a :b | a vertices size > b vertices size].
					mainPolyline := thePolylines first.
					thePolylines remove: mainPolyline.	"Controle si le mainPolyline ne contient pas d'autres polylines (cas connexite = 8)"	"Marche pas trop ! Voir avec example de Geometric :
	comp := CompositePart new.
	comp add: g1. <Wapper>
	comp add: g2.
	win component: (BoundedWrapper on: comp)."
					thePolylines isEmpty
						ifFalse:
							[| extension |
							extension := thePolylines.
							[extension isEmpty]
								whileFalse:
									[extension := Set new.
									thePolylines
										do:
											[:pol | 
											pol
												verticesDo:
													[:pt | 
													(mainPolyline vertices contains: [:ptm | ptm = pt])
														ifTrue: [extension add: pol]]].
									extension
										do:
											[:poly | 
											| v |
											v := mainPolyline vertices asOrderedCollection.
											v addAll: poly vertices.
											mainPolyline := Polyline vertices: v.
											thePolylines remove: poly]]].
					self includedEntities: Set new.
					self image: mainPolyline.	"le centre de l'agregat correspond au centre du 1er element"
					self center: (self at: 1) center.
					self includedEntities addAll: thePolylines]]
]

{ #category : #obsolete }
CMSpatialEntityAggregate >> setImage4 [
	
	| vertices mainPolyline epiderme |
	OrderedCollection new.
	self halt.
	epiderme := self getEpidermis.
	vertices := OrderedCollection new.
	epiderme do: [:c | vertices addAll: c image component asPolyline vertices].
	mainPolyline := Polyline vertices: vertices.
	self image: mainPolyline
]

{ #category : #obsolete }
CMSpatialEntityAggregate >> setImageFromIrregularCells [
	
	| mainPolyline |
	mainPolyline := Polyline vertices: self outline.
	self image: mainPolyline.	"le centre de l'agregat correspond au centre du 1er element"	"self includedEntities addAll: thePolylines"
	self center: (self at: 1) center
]

{ #category : #displaying }
CMSpatialEntityAggregate >> setOutline [
	"clp mars 2000"
	
	| directions |
	"outline est une collection de couples de valeurs (id de cellule; collection de directions)"
	self outline: Set new.
	self getSkinE
		do:
			[:c | 
			directions := Set new.
			directions addAll: c boundaryDirections.
			(c neighbourhood
				select: [:cc | (self elementaryComponents includes: cc) not])
				do: [:on | directions add: (c directionNeighbour: on)].
			self outline
				add:
					(Array
						with: c id
						with: directions)]
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
