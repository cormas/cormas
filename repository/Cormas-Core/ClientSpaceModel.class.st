Class {
	#name : #ClientSpaceModel,
	#superclass : #Model,
	#instVars : [
		'remoteSpaceModel',
		'cachedValues',
		'elementaryEntitiesDefaultPovs',
		'distributionControl'
	],
	#category : #'Cormas-Core-Others'
}

{ #category : #'private - absoluteWorld' }
ClientSpaceModel >> absoluteBounds [
	
	^self cachedValueAt: #absoluteBounds
]

{ #category : #'private - absoluteWorld' }
ClientSpaceModel >> absoluteHeight [
	
	^self absoluteBounds height
]

{ #category : #'private - absoluteWorld' }
ClientSpaceModel >> absoluteWidth [
	
	^self absoluteBounds width
]

{ #category : #'private - absoluteWorld' }
ClientSpaceModel >> boundaries [
	
	^self cachedValueAt: #boundaries
]

{ #category : #accessing }
ClientSpaceModel >> cachedValueAt: aSymbol [
	
	^self cachedValues
		at: aSymbol
		ifAbsentPut: [remoteSpaceModel perform: aSymbol]
]

{ #category : #accessing }
ClientSpaceModel >> cachedValues [
	
	^cachedValues ifNil: [cachedValues := IdentityDictionary new]
]

{ #category : #accessing }
ClientSpaceModel >> cellClass [
	
	^self cachedValueAt: #cellClass
]

{ #category : #accessing }
ClientSpaceModel >> column [
	
	^self cachedValueAt: #column
]

{ #category : #accessing }
ClientSpaceModel >> cormasModel [
	
	^self cachedValueAt: #cormasModel
]

{ #category : #accessing }
ClientSpaceModel >> cormasModelClass [
	
	^self cachedValueAt: #cormasModelClass
]

{ #category : #'private - regular cells - instance creation' }
ClientSpaceModel >> createCellsPovWithReferences: entitiesRef [
	"creation de l'ensemble des cellules et leurs connections"
	
	self gridCellShape = #squared
		ifTrue: [self createRectangularCellsPovWithReferences: entitiesRef].
	self gridCellShape = #hexagonal
		ifTrue: [self createHexagonalCellsPovWithReferences: entitiesRef]
]

{ #category : #'private - regular cells - instance creation' }
ClientSpaceModel >> createHexagonalCellsPovWithReferences: entitiesRef [
	"On enleve le nombre de poly a hauteur et largeur afin de laisser une 
	bordure"

	"calcul du diametre du cercle"

	| hexagone translation hexagoneInfo delay lineCounter aPov i |
	hexagoneInfo := self createTopLeftHexagonalCellsFigure.	"SpatialEntityCoordinates new: (hexagoneInfo at: 'object') =>pour inspecter la tete que √ßa a"
	hexagone := hexagoneInfo at: 'object'.
	translation := hexagoneInfo at: 'translation'.
	delay := hexagoneInfo at: 'delay'.
	lineCounter := 1.
	i := 1.
	self line
		timesRepeat: [ lineCounter odd
				ifTrue: [ hexagone := hexagone translatedBy: delay @ 0 ]
				ifFalse: [ hexagone := hexagone translatedBy: delay negated @ 0 ].
			lineCounter := lineCounter + 1.
			self column
				timesRepeat: [ aPov := VectorialElementaryPOV new: hexagone asPolyline.
					aPov name: #nil.
					aPov entityReference: (entitiesRef at: i).
					self elementaryEntitiesDefaultPovs add: aPov.
					hexagone := hexagone translatedBy: translation x @ 0	"SpatialEntityCoordinates new: (hexagone) =>pour inspecter la tete que √ßa a" ].
			hexagone := hexagone
				translatedBy: (self column * translation x negated) @ translation y ].
	self flag:#TODO.
		"c''est ici qu''il faut corriger le bug de decalage des cellules en bas à droite sous vw7.9"
]

{ #category : #'private - regular cells - instance creation' }
ClientSpaceModel >> createRectangularCellsPovWithReferences: entitiesRef [
	"creation des coordonnees de l'ensemble des cellules carrees de la grille"
	
	| cote carre aPov i |
	self elementaryEntitiesDefaultPovs: nil.
	cote := self absoluteBounds height / self line.
	carre := Rectangle
		origin: (cote * -1) @ 0
		corner: 0 @ cote.
	i := 1.
	self line
		timesRepeat:
			[self column
				timesRepeat:
					[carre := carre translatedBy: carre width @ 0.
					aPov := VectorialElementaryPOV new: carre asPolyline.
					aPov name: #nil.
					aPov entityReference: (entitiesRef at: i).
					self elementaryEntitiesDefaultPovs add: aPov].
			carre := carre
				translatedBy: (self column negated * carre width) @ carre height]
]

{ #category : #'private - regular cells - instance creation' }
ClientSpaceModel >> createTopLeftHexagonalCellsFigure [
	"return a Dictionary ('translation'->47.619@41.2393 'delay'->23.8095 'object'->a Polyline ) where a Polyline is a perfect hexagon"
	"soit r le rayon du cercle passant par tous les sommets de l'hexagone, alors, la hauteur de l'hexagone 
	est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. 
	- Pour rentre n hexagones sur une ligne (n=self column), il nous faut une longueur (absoluteLength) de (n+ 1/2)*largeur d'hexagone.
cad : absoluteLength = (n+ 0.5) * 2r cos 30¬∞ = (column + 0.5) * 2r cos 30¬∞
	- Pour rentrer p hexagones sur une colonne (p=self line), il nous faut une hauteur (absoluteLength) de (3.p+ 1)*largeur d'hexagone/4.
cad : absoluteLength = (3.p + 1)*(2r) / 4
	On conna√Æt la largeur et la hauteur de la fen√™tre. On calcule le 
	 - rLine = le 	rayon de l'hexagone n√©c√©ssaire pour rentrer n hexagones sur une ligne, et 
	- rColumn = le rayon de l'hexagone n√©c√©ssaire pour rentrer p hexagones sur une colonne. "
	
	| rLine rColumn thePoints hexagone hexagoneInfo rMax |
	"absoluteLength = (n+ 0.5) * 2rLine cos 30¬∞ => rLine =  absoluteLength / ((n+0.5).2 cos30) = absoluteLength / ((n+0.5). V3)"
	rLine := self absoluteWidth / ((self column + 0.5) * 3 sqrt).	"absoluteLength = (3.p + 1)*(2r) / 4 => rColumn = 2*absoluteLength /(3.p+1)"
	rColumn := 2 * (self absoluteHeight / (self line * 3 + 1)).
	hexagone := HexagonPOV polylineFromHeight: rLine length: rColumn.
	rMax := (rLine * 30 degreesToRadians cos) rounded.	"la largeur de l'hexagon = 2r cos 30¬∞"
	hexagone := hexagone translatedBy: rMax @ rColumn.	"on d√©place l'h√©xagone de la moitier de sa largeur et de sa heuteur"
	hexagoneInfo := Dictionary new.
	hexagoneInfo at: 'object' put: hexagone.
	thePoints := hexagone vertices.
	hexagoneInfo
		at: 'translation'
		put:
			((thePoints at: 6) x - (thePoints at: 2) x)
				@ ((thePoints at: 1) y - (thePoints at: 3) y).
	hexagoneInfo
		at: 'delay'
		put: (thePoints at: 1) x - (thePoints at: 2) x.
	^hexagoneInfo
]

{ #category : #'error handling' }
ClientSpaceModel >> doesNotUnderstand: aMessage [
	
	(self remoteSelectors includes: aMessage selector)
		ifTrue:
			[^self remoteSpaceModel
				perform: aMessage selector
				withArguments: aMessage arguments].
	self halt.
	^self
		perform: aMessage selector
		withArguments: aMessage arguments
]

{ #category : #accessing }
ClientSpaceModel >> elementaryEntitiesDefaultPovs [
	
	^elementaryEntitiesDefaultPovs
		ifNil: [elementaryEntitiesDefaultPovs := OrderedCollection new]
]

{ #category : #accessing }
ClientSpaceModel >> elementaryEntitiesDefaultPovs: anObject [
	
	elementaryEntitiesDefaultPovs := anObject
]

{ #category : #'user interface' }
ClientSpaceModel >> envSpecStringFor: spatialEntityName [
	
	^self remoteSpaceModel envSpecStringFor: spatialEntityName
]

{ #category : #'private - accessing' }
ClientSpaceModel >> gridCellShape [
	self halt:#TODO. "pourquoi ne pas en faire un cached value?"
	^ self remoteSpaceModel gridCellShape
]

{ #category : #accessing }
ClientSpaceModel >> line [
	
	^self cachedValueAt: #line
]

{ #category : #'private - accessing' }
ClientSpaceModel >> localOpenedSpatialGridsForHabitus: aStringOrNil [
	"Purpose: return a collection of opened spatial grids corresponding to a habitus named aStringOrNil.
	nil is used to collect all spatial grids
	hack because of opentalk and distributed : looking for SpatialGrid in the dependents is wrong because :
	- some spatialGrids are remote
      - in this case, the registered object is a ClientSpaceModel and not a SpaceInterface
	- Opentalk register a LocalDependent in order to optimize communication
      the actual hack is simple : send a normal update to dependents with #openedSpatialGrid, asking them to register iteself in the result collection.
	Since simple collection have a #value passMode, force a #reference passMode for this result.
	
	"
	
	| result |
	result := OrderedCollection new.
	self
		changed: #openedSpatialGridsForHabitus:
		with: aStringOrNil -> result.
	^result
]

{ #category : #networking }
ClientSpaceModel >> on: aDistributionControl [
	
	self resetCache.
	distributionControl := aDistributionControl.
	remoteSpaceModel := distributionControl currentSimulation spaceModel.
	remoteSpaceModel addDependent: self
]

{ #category : #opening }
ClientSpaceModel >> openSpaceInterface [
	"open a SpaceInterface on remoteSpaceModel"
	
	self elementaryEntitiesDefaultPovs isEmpty
		ifTrue:
			[self
				createCellsPovWithReferences:
					(EntityReference onEntities: self elementaryEntities)].
	^SpaceInterface openAndDisplay: self
]

{ #category : #'error handling' }
ClientSpaceModel >> remoteSelectors [
	
	^#(#absoluteBounds #gridCellShape #nbNeighbours #timeUnitName #envSpecStringFor: #boundaries #spatialClasses #cormasModel #spatialEntities #cormas #testSpatialEntitiesAt:povAt: #spatialEntitiesAt: #allTheEntities: #allTheSituatedEntities: #spatialEntitiesAt:withPovResultFor: #getPovsDataOfEntity:forSelector:andInfo: #getPovsDataOfOccupantEntity:forSelector:andInfo: #elementaryEntities)
]

{ #category : #accessing }
ClientSpaceModel >> remoteSpaceModel [
	
	^remoteSpaceModel
]

{ #category : #caching }
ClientSpaceModel >> resetCache [
	
	cachedValues := nil
]

{ #category : #caching }
ClientSpaceModel >> resetCache: aSymbol [
	
	^self cachedValues removeKey: aSymbol
]

{ #category : #accessing }
ClientSpaceModel >> spatialClasses [
	
	^self cachedValueAt: #spatialClasses
]

{ #category : #accessing }
ClientSpaceModel >> timeStep [
	
	^self remoteSpaceModel timeStep
]

{ #category : #'user interface' }
ClientSpaceModel >> timeUnitName [
	
	^self remoteSpaceModel timeUnitName
]

{ #category : #updating }
ClientSpaceModel >> update: anAspectSymbol with: aParameter from: aSender [
	
	anAspectSymbol = #openedSpatialGridsForHabitus:
		ifTrue: [^self changed: anAspectSymbol with: aParameter].	" hack : avoid isKindOf: when getting SpaceInterface from openedSpatialGrid"
	anAspectSymbol = #timeChanged
		ifTrue: [^self changed: anAspectSymbol with: aParameter].
	anAspectSymbol = #noticeChanges
		ifTrue:
			[aParameter isEmpty ifTrue: [^self].
			^self changed: #noticeChanges with: aParameter].
	anAspectSymbol = #noticeChange
		ifTrue: [^self changed: #noticeChange with: aParameter].
	anAspectSymbol = #createCellsPovWithReferences
		ifTrue: [^self createCellsPovWithReferences: aParameter]
]
