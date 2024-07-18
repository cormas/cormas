"
SpaceModel has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	activeAttribute	<ByteSymbol>	Name of the attribute selected from the menu Tools -> Click to... -> Change attribute... -> 
	activeAttributeValue	<String>	Value entered when requested by the action just above
	activeSpatialEntity	<ClassName>	From the pov contextual menu, the spatial entity class that has been selected to be displayed
	arrayOrigins	<Array>	 Array of the points representing the centers of the matrix cells within the window coordinates system
	boundaries	<ByteSymbol>	either #toroidal or #closed
	cardinal	<Integer>	line * column, total number of cells defining the spatial grid
	column	<Integer>	number of columns of the spatial grid
	cormasModel	<CormasModel>	the instance of CormasModel connected to the spaceModel
	delimiter	<Integer>	0 for false, 1 for true: explicit separator lines between adjacent cells
	gridCellImage	<Wrapper>	Wrapper of a regular cell (depends on the size of the window)
	gridCellShape	<ByteSymbol>	#squared, #hexagonal or #irregular
	line	<Integer>	number of lines of the spatial grid
	nbNeighbours	<ByteSymbol>	#four, #six or #eight
	rMaxEntityImage	<Float>	
	spatialEntities	<Dictionary>	keys are class names of the different spatial entities of the coresponding CormasModel, values are lists of existing instances
			
	xll, yll ??


"
Class {
	#name : 'CMSpaceModel',
	#superclass : 'Object',
	#instVars : [
		'activeSpatialEntity',
		'line',
		'column',
		'elementaryEntitiesDefaultPovs',
		'cormasModel',
		'arrayOrigins',
		'rMaxEntityImage',
		'spatialEntities',
		'gridCellShape',
		'absoluteBounds',
		'autoResizeBounds',
		'nbConfiguration',
		'gridSize',
		'activePoVsDictionary',
		'isClosedEnvironment'
	],
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'defaults' }
CMSpaceModel class >> defaultIsClosedEnvironment [

	^ true
]

{ #category : 'defaults' }
CMSpaceModel class >> defaultLines [
	" Answer the <Number> of default lines to create in the receiver's grid "
	
	^ 10
]

{ #category : 'instance creation' }
CMSpaceModel class >> forModel: aCormasModel [
	" Answer a new space configured for aCormasModel "

	^ self basicNew 
		cormasModel: aCormasModel;
		initialize;
		yourself.
]

{ #category : 'private - absoluteWorld' }
CMSpaceModel >> absoluteBounds [
	" The absolute default space is a square space of 50x50. It has been defined for a 10x10 cells space.
	It is never display, only copied by the SpaceViews.
	It can be modified (setAbsoluteBounds) when for exemple there is 3 lines and 10 column. Then, absoluteBounds = 3/10 * 50 @ 50 "
	
	^ absoluteBounds 
		ifNil: [ absoluteBounds := Rectangle origin: 0 @ 0 extent: 50 @ 50 ]
]

{ #category : 'private - absoluteWorld' }
CMSpaceModel >> absoluteBounds: aRectangle [
	
	absoluteBounds := aRectangle
]

{ #category : 'private - absoluteWorld' }
CMSpaceModel >> absoluteHeight [
	" Answer an <Integer> representing the receiver's height from the absolute bounds "

	^ self absoluteBounds height
]

{ #category : 'private - absoluteWorld' }
CMSpaceModel >> absoluteWidth [
	" Answer an <Integer> representing the receiver's width from the absolute bounds "

	^ self absoluteBounds width
]

{ #category : 'accessing' }
CMSpaceModel >> activePoVsDictionary [
	" Answer a <Dictionary> containing the initial active points of view of the receiver's model "

	^ activePoVsDictionary
		ifNil: [ activePoVsDictionary := Dictionary new ]
]

{ #category : 'deprecated' }
CMSpaceModel >> aggregate: listPolygons [
	"merge-aggregation of the other polygons on the first of the list"

	| fusion allPolygons theOthers |
	listPolygons isEmpty
		ifFalse: [ "Beware of listPolygons ordering !!!"
			theOthers := listPolygons copyFrom: 2 to: listPolygons size.
			fusion := listPolygons first.	"Calculation of the new origin coordinates"
			fusion outline: (self outlineAggregatedFrom: listPolygons).	"Updating the coordinates of the polygon image in the drawing window"
			self setImagesPolygons: (Array with: fusion).	"we need to remove polygons that are supposed to no longer exist before attacking the neighborhood"
			allPolygons := self cormasModel
				perform:
					(self cormasModel getterForEntityClass: listPolygons first class).
			allPolygons removeAll: theOthers.	"Reconstruction of the neighbourhood of the new polygon"
			fusion neighbourhoodWithNils: nil.
			self voisinsPolygonesNoeuds: (Array with: fusion).	"Reconstruction of the neighbourhood of the neighbours of the new polygon"
			fusion neighbourhood do: [ :p | p neighbourhoodWithNils: nil ].
			self
				voisinsPolygonesNoeuds: fusion neighbourhood asOrderedCollection.	"Updating the components of the new spatial entity, in case it is composed of"
			(fusion class inheritsFrom: CMSpatialEntityElement)
				ifFalse: [ theOthers do: [ :p | fusion addComponents: p components ] ] ]
]

{ #category : 'deprecated' }
CMSpaceModel >> aggregate: listPolygons new: entityC [
	"Creation of an N+1 level integer by aggregation of N level polygons"

	"!!! The elements of listPolygons must be adjacent. !!!"

	| newEntityC |
	listPolygons isEmpty
		ifFalse: [ newEntityC := entityC new init.	"Calcul des coordonnees d'origine"
			newEntityC outline: (self outlineAggregatedFrom: listPolygons).	"Updating the coordinates of the polygon image in the drawing window"
			self setImagesPolygons: (Array with: newEntityC).	"Construction of the neighbourhood of the new polygon"
			newEntityC neighbourhoodWithNils: nil.
			self voisinsPolygonesNoeuds: (Array with: newEntityC).	"Reconstruction of the neighbourhood of the neighbours of the new polygon"
			newEntityC neighbourhood do: [ :p | p neighbourhoodWithNils: nil ].
			self
				voisinsPolygonesNoeuds: newEntityC neighbourhood asOrderedCollection.	"Updating the components of the new spatial entity"
			newEntityC addComponents: listPolygons.
			(self cormasModel
				perform: (self cormasModel getterForEntityClass: entityC))
				add: newEntityC ]
]

{ #category : 'accessing' }
CMSpaceModel >> aggregateClasses [
	^ self cormasModelClass compoundSpatialClasses
]

{ #category : 'accessing' }
CMSpaceModel >> aggregatesEntities [
	
	| aCollection |
	aCollection := OrderedCollection new.
	self aggregateClasses
		do:
			[:cl | 
			aCollection
				addAll:
					(self spatialEntities
						at: cl name
						ifAbsent: [OrderedCollection new])].
	^aCollection
]

{ #category : 'deprecated' }
CMSpaceModel >> aggregatesInstancesOf: entityE condition: methodName [
	| nameEntitiesE theInterestingEntitiesE setOfComponents seed neighbours newNeighbours |
	nameEntitiesE := self cormasModel getterForEntityClass: entityE.
	theInterestingEntitiesE := ((self cormasModel
		perform: nameEntitiesE asSymbol)
		select: [ :c | c perform: methodName ]) copy asOrderedCollection.
	[ theInterestingEntitiesE isEmpty ]
		whileFalse: [ setOfComponents := Set new.
			seed := theInterestingEntitiesE first.
			setOfComponents add: seed.
			neighbours := seed neighbourhood
				select: [ :v | v perform: methodName ].
			[ neighbours isEmpty ]
				whileFalse: [ setOfComponents addAll: neighbours.
					newNeighbours := Set new.
					neighbours
						do: [ :v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select:
											[ :u | (u perform: methodName) and: [ (setOfComponents includes: u) not ] ]) ].
					neighbours := newNeighbours ].
			setOfComponents size > 1
				ifTrue: [ setOfComponents := setOfComponents asOrderedCollection.
					setOfComponents
						remove: seed;
						addFirst: seed.
					self aggregate: setOfComponents ].
			setOfComponents do: [ :c | theInterestingEntitiesE remove: c ] ]
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> ajouterAutresAttribut: cel objet: objet attribut: attrib [
	"Ex: cel = 0.49018@13.7327   objet = a Cell   attrib = 'center'"
	
	| listeAttributs position |
	listeAttributs := objet class allInstVarNames.
	1
		to: listeAttributs size
		do: [:b | (listeAttributs at: b) = attrib ifTrue: [position := b]].
	objet instVarAt: position put: cel
]

{ #category : 'accessing' }
CMSpaceModel >> allOccupants [
	" Answer a <Collection> of all the located entities"

	^ self cormasModel allTheEntities select: #isSituated
]

{ #category : 'accessing' }
CMSpaceModel >> allTheEntities: aClass [
	^ self cormasModel allTheEntities: aClass
]

{ #category : 'accessing' }
CMSpaceModel >> allTheSituatedEntities: aClass [
	
	^self cormasModel allTheSituatedEntities: aClass
]

{ #category : 'private - accessing' }
CMSpaceModel >> arrayOrigins: anArray [
	
	arrayOrigins := anArray
]

{ #category : 'accessing' }
CMSpaceModel >> atClass: aCMSpatialEntityClass putActivePovSelector: aSelector [ 
	" Set a Point of View defined in aSelector <Symbol> at class aCMSpatialEntityClass "

	self activePoVsDictionary at: aCMSpatialEntityClass put: aSelector
]

{ #category : 'accessing' }
CMSpaceModel >> autoResizeBounds [
	^ autoResizeBounds ifNil: [ autoResizeBounds := true ]
]

{ #category : 'accessing' }
CMSpaceModel >> autoResizeBounds: anObject [
	autoResizeBounds := anObject
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> basicCreateAggregate: compoundEntity from: aSet [
	"Creates and returns an instance of compoundEntity composed with a set of cells. The new aggregate is not displayed, nor added to theXXs collection and the components are not informed.
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := compoundEntity basicNew.
	anAggregate components addAll: aSet asOrderedCollection.
	anAggregate setSurround.
	anAggregate init.
	^anAggregate
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> buildAggregates: compoundEntity from: baseEntity verifying: aBlock [
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock, except that the aggregats are not reset.
baseEntity = a subClass of <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>"
	
	^self buildAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> buildAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms [
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms, except that the previous aggregats are not reset.
baseEntity = a subClass of  <SpatialEntity>
aBlock example = [:cell | cell state = #tree]
compoundEntity =a subClass of  <SpatialEntitySet>
ms= <integer> must be >= 1"

	| coll |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	coll := IndexedSet new.
	(self getAggregatesFrom: baseEntity verifying: aBlock)
		do: [ :set | 
			set size < ms
				ifFalse: [ coll add: (self createSilentlyAggregate: compoundEntity from: set) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ coll
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> buildAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity [
	" ! Deprecated ! Should use : "
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> buildAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity minimumSize: ms [
	" ! Deprecated ! Should use : "
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> buildFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement [
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method do not resets all aggregates 'compoundEntity' . 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a subClass of  <SpatialEntityNotConnex>"

	| aSet agg |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	aSet := Set new.
	aCollecOfSpatialEntityElement
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifTrue: [ aSet add: s ] ].
	agg := self createSilentlyAggregate: compoundEntity from: aSet.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ agg
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellAt: aRowIndex at: aColumnIndex [
	
	^ self elementaryEntities at: (aRowIndex - 1) * column + aColumnIndex
]

{ #category : 'accessing' }
CMSpaceModel >> cellClass [
	"return the SpatialEntityElement class of the current model"

	^ self cormasModelClass cellClass
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsBetweenColumn1: colNumber1 andColumn2: colNumber2 [
	"Return the cells between the colNumber1 and the colNumber2 of the spatial grid.
colNumber1   <Integer> lineNumber = Positive Integer
colNumber2   <Integer> colNumber = Positive Integer"

	| cells byStep |
	byStep := colNumber1 > colNumber2
		ifTrue: [ -1 ]
		ifFalse: [ 1 ].
	cells := OrderedCollection new.
	colNumber1 to: colNumber2 by: byStep do: [ :i | cells addAll: (self cellsOfColumn: i) ].
	^ cells
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsBetweenLine1: lineNumber1 andLine2: lineNumber2 [
	"Return the cells between the lineNumber1 and the lineNumber2 of the spatial grid.
lineNumber1   <Integer> lineNumber = Positive Integer
lineNumber2   <Integer> colNumber = Positive Integer"

	| cells byStep |
	byStep := lineNumber1 > lineNumber2
		ifTrue: [ -1 ]
		ifFalse: [ 1 ].
	cells := OrderedCollection new.
	lineNumber1 to: lineNumber2 by: byStep do: [ :i | cells addAll: (self cellsOfLine: i) ].
	^ cells
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsBetweenLine1: lineNumber1 line2: lineNumber2 andColumn1: colNumber1 column2: colNumber2 [
	"Purpose: Return the cells between the lines lineNumber1 and lineNumber2, and between the columns colNumber1 and colNumber2 of the spatial grid. The Cells are sorted by id.
Arguments: lineNumber1   <Integer> lineNumber = Positive Integer
Arguments: lineNumber2   <Integer> colNumber = Positive Integer
Arguments: colNumber1   <Integer> lineNumber = Positive Integer
Arguments: colNumber2   <Integer> colNumber = Positive Integer
Example:  cellsBetweenLine1: 1 line2: 6 andColumn1: 2 column2: 3  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"

	| l1 l2 c1 c2 cellsCol |
	l1 := lineNumber1 min: lineNumber2.
	l2 := lineNumber1 max: lineNumber2.
	c1 := colNumber1 min: colNumber2.
	c2 := colNumber1 max: colNumber2.
	cellsCol := self cellsBetweenColumn1: c1 andColumn2: c2.
	^ (self cellsBetweenLine1: l1 andLine2: l2)
		select: [ :c | cellsCol includes: c ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsIntoRectangle: aRectangle [
	"This method is deprecated. Please use cellsBetwenLine1:line2:andColumn1:column2: instead.
Purpose: Return the cells between the lineNumber and the colNumber of the spatial grid. The Cells are sorted by id.
Argument: aRectangle   <Rectangle> where origin < corner.
Example:  cellsIntoRectangle: (Rectangle origin: 1@2 corner: 6@3)  ->  a collection of cells between columns 2 and 3, and between lines 1 and 6, and ordered from line 1 to line 6"

	| cellsCol |
	self
		deprecated: 'Please use cellsBetwenLine1:line2:andColumn1:column2: instead.'.
	cellsCol := self
		cellsBetweenColumn1: aRectangle origin y
		andColumn2: aRectangle corner y.
	^ (self
		cellsBetweenLine1: aRectangle origin x
		andLine2: aRectangle corner x) select: [ :c | cellsCol includes: c ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsIntoRectangleFrom: cell1 to: cell2 [
	"Return the cells between the lineNumber and the colNumber of the spatial grid. The Cells are ordered from cell1 to cell2.
cell1   <SpatialEntityElement>  
cell2   <SpatialEntityElement> "
	
	| firstCell lastCell invert cells |
	cell1 id = (cell1 id min: cell2 id)
		ifTrue:
			[firstCell := cell1.
			lastCell := cell2.
			invert := false]
		ifFalse:
			[firstCell := cell2.
			lastCell := cell1.
			invert := true].
	cells := OrderedCollection new.
	firstCell columnNumber < lastCell columnNumber
		ifTrue:
			[firstCell rowNumber
				to: lastCell rowNumber
				do: [:i | cells addAll: (self cellsOfLine: i)]]
		ifFalse:
			[firstCell rowNumber
				to: lastCell rowNumber
				do: [:i | cells addAll: (self cellsOfLine: i) reverse]].
	cells := cells
		select:
			[:c | 
			c columnNumber
				between: (firstCell columnNumber min: lastCell columnNumber)
				and: (firstCell columnNumber max: lastCell columnNumber)].
	invert ifTrue: [cells := cells reverse].
	^cells
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsOfColumn: colNumber [
	"Return the cells in the colNumber of the spatial grid.
colNumber   <Integer> colNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell columnNumber = colNumber ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsOfLine: lineNumber [
	" Answer a <Collection> of <> cells in the lineNumber of the spatial grid.
	lineNumber   <Integer> lineNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell rowNumber = lineNumber ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> centralLocation [
	(line even or: [ column even ])
		ifTrue: [ ^ self error: 'Grid dimensions is not odd' ].
	^ self elementaryEntities at: (line * column / 2) asInteger + 1
]

{ #category : 'private - notification' }
CMSpaceModel >> changed: anAspectSymbol with: aParameter [
	"All changes are redirected to cormasModel which can buffer them"
	
	self cormasModel registerSpaceModelChange: anAspectSymbol with: aParameter
]

{ #category : 'private - accessing' }
CMSpaceModel >> column [
	" Answer the <Number> of columns in the receiver's grid "
	
	^ column
		ifNil: [ column := self defaultColumns ]
]

{ #category : 'private - accessing' }
CMSpaceModel >> connexity [
	" Answer an <Integer> representing the value of the grid connexity, i.e. 8, 4 or 6.
	If the grid is irregular, returns 0"
	
	self gridCellShape = #irregular
		ifTrue: [ ^ 0 ].
	^ self nbConfiguration cardinal
]

{ #category : 'private - accessing' }
CMSpaceModel >> cormas [
	
	^cormasModel cormas
]

{ #category : 'private - accessing' }
CMSpaceModel >> cormasModel [
	" Answer the receiver's configured <CMAbstractModel> or nil "

	^ cormasModel
]

{ #category : 'private - accessing' }
CMSpaceModel >> cormasModel: aCormasModel [
	" The cormasModel is some kind of model for the spaceModel (receive notification) "
	
	cormasModel := aCormasModel.

]

{ #category : 'accessing' }
CMSpaceModel >> cormasModelClass [
	^ self cormasModel class
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> createAggregate: compoundEntity from: aSet [
	"Creates and returns an instance of compoundEntity composed with a set of cells. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := self newEntity: compoundEntity.
	anAggregate addSilentlyComponents: aSet asOrderedCollection.
	self spatialEntities
		at: compoundEntity name
		ifAbsentPut: [OrderedCollection new].
	(self spatialEntities at: compoundEntity name) add: anAggregate.
	anAggregate init.
	^anAggregate
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> createCells [
	" Create all the cells and their connexions, and collect them as elementaryEntities collection "

	self initNeighbourhood.
	"newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
	"self sendCellsToClientSpaceModels: (EntityReference onEntities: allEse)."	
	"dispatch the info that cells have been modified to all opened spaceInterfaces"

]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> createElementaryEntities [
	"create all the cells and their connexions, and collect them as elementaryEntities collection"

	| allEse |

	allEse := Array new: self gridSize.
	self cormasModelClass cellClass currentId: 0.
	(1 to: self gridSize) 
		do: [ :i | allEse at: i put: (self newEntity: self cormasModelClass cellClass) ]
		displayingProgress: 'Creating cells...'.
	self elementaryEntities: allEse.
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> createHexagonalCellsFigure [
	"On enleve le nombre de poly a hauteur et largeur afin de laisser une 
	bordure"

	"calcul du diametre du cercle"

	| hexagone translation hexagoneInfo delay lineCounter aPov i |
	self elementaryEntitiesDefaultPovs: nil.
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
					aPov
						entityReference: (EntityReference on: (self elementaryEntities at: i)).
					self elementaryEntitiesDefaultPovs add: aPov.
					hexagone := hexagone translatedBy: translation x @ 0.	"SpatialEntityCoordinates new: (hexagone) =>pour inspecter la tete que √ßa a"
					i := i + 1 ].
			hexagone := hexagone
				translatedBy: (self column * translation x negated) @ translation y ].
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> createOneAggregate: compoundEntity from: aSet [
	"Creates and returns an instance of compoundEntity composed with a set of cells. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| aggregate |
	aggregate := self createAggregate: compoundEntity from: aSet.	"alarm the other"
	self dispatchOneCompoundSpatialEntity: aggregate.
	^aggregate
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> createRectangularCellsFigure [
	" Private - Create coordinates of the set of square cells of the grid "
	
	| cote rect aPov i |
	
	self elementaryEntitiesDefaultPovs: nil.
	self setAbsoluteBounds.
	cote := self absoluteBounds height / self line.	
	"cote := self absoluteBounds width / self column.  c'est pareil"
	rect := Rectangle
		origin: (cote * -1) @ 0
		corner: 0 @ cote.
	i := 1.
	self line timesRepeat: [ 
		self column timesRepeat: [
			rect := rect translateBy: rect width @ 0.
			aPov := VectorialElementaryPOV new: rect asPolyline.
			aPov name: #nil.
			aPov entityReference: (EntityReference on: (self elementaryEntities at: i)).
			self elementaryEntitiesDefaultPovs add: aPov.
			i := i + 1 ].
		rect := rect translateBy: (self column negated * rect width) @ rect height ].

]

{ #category : 'private - regular polygons' }
CMSpaceModel >> createSilentlyAggregate: compoundEntity from: aSet [
	"Creates and returns an instance of compoundEntity composed with a set of cells. The new aggregate is not displayed.
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := self newEntity: compoundEntity.
	anAggregate addSilentlyComponents: aSet asOrderedCollection.
	anAggregate setSurround.
	self spatialEntities
		at: compoundEntity name
		ifAbsentPut: [OrderedCollection new].
	(self spatialEntities at: compoundEntity name) add: anAggregate.
	anAggregate init.
	^anAggregate
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> createTopLeftHexagonalCellsFigure [
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

{ #category : 'defaults' }
CMSpaceModel >> defaultColumns [
	" Answer the <Number> of default columns to create in the receiever's grid "

	^ 10 
]

{ #category : 'defaults' }
CMSpaceModel >> defaultGridSize [
	" Answer a <Number> representing how many cells we create in the grid by default "
	
	^ 100
]

{ #category : 'defaults' }
CMSpaceModel >> defaultLines [
	" Answer the <Number> of default lines to create in the receiver's grid "
	
	^ self class defaultLines 
]

{ #category : 'accessing' }
CMSpaceModel >> deleteSpatialEntitySet: aSpatialEntitySetClass [
	" Remove the instances of aSpatialEntitySetClass. The instances are destroyed, but not their components.
	The collectGarbage is immediately performed  (ie. 'theXXXs' collection is emptied)
	<aSpatialEntitySetClass = a subclass of SpatialEntitySet> "

	self spaceModel resetCompoundSpatialEntity: aSpatialEntitySetClass
]

{ #category : 'accessing' }
CMSpaceModel >> dimensions [
	" Answer a <Point> with the receiver's lines and columns "
	
	^ self column @ self line
]

{ #category : 'private - dispatch' }
CMSpaceModel >> dispatchCompoundSpatialEntity: class [
	"Gives the new entities to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel
		setTheEntity: class
		with: (self spatialEntitiesAt: class name).
	self cormasModel registerSpaceModelChange: #newAggregates with: class
]

{ #category : 'private - dispatch' }
CMSpaceModel >> dispatchOneCompoundSpatialEntity: anEntity [
	"Gives the new entity to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel collect: anEntity.
	self cormasModel
		registerEntityChange: #addAggregate
		with: (EntityReference onEntities: anEntity components)
		from: (EntityReference on: anEntity)
]

{ #category : 'private - display' }
CMSpaceModel >> displayInfo: aSymbol of: aClass [
	"Purpose: set the INFO of aClass to be displayed on the opened spatial grid
Example : self displayInfo: #landUse of: Cell"
	
	self openedSpatialGrids
		do: [:interface | interface changeInfo: aSymbol ofEntity: aClass]	"self changed: #changeInfo: with: (DisplayPovChange forPov: aSymbol ofEntity: aClass)"
]

{ #category : 'private - display' }
CMSpaceModel >> displayPov: aSymbol of: aClass [
	"Purpose: set the POV of aClass to be displayed on the opened spatial grid.
	For efficency add subclasses of aClass.
	Example : self displayPov: #landUse of: Cell"
	
	self atClass: aClass putActivePovSelector: aSymbol.
	aClass concreteSubclasses do: [ : concreteClass |
		self atClass: concreteClass putActivePovSelector: aSymbol ]

]

{ #category : 'landscape indices' }
CMSpaceModel >> distanceFromCell: cell1 toCell: cell2 [
	"return the distance in number of cells (also known as Manhattan distance)"

	| nbLines nbCols |
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	self isClosedEnvironment
		ifFalse: [ nbLines > (self line - 2)
				ifTrue: [ nbLines := nbLines - self line + 2 ].
			nbCols > (self column - 2)
				ifTrue: [ nbCols := nbCols - self column + 2 ] ].
	^ self nbConfiguration distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols.

]

{ #category : 'landscape indices' }
CMSpaceModel >> distanceFromHexagonalCell: cell1 toCell: cell2 [
	"return the distance in number of hexagonal cells"

	| nbLines nbCols add colTheoriq |
	
	self nbNeighbours = 6
		ifFalse: [ self halt ].
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	self isClosedEnvironment
		ifFalse: [ nbLines := nbLines min: self line - nbLines.
			nbCols := nbCols min: self column - nbCols.
			nbLines odd
				ifTrue: [ nbCols := nbCols + 1 ] ].
	add := 0.
	colTheoriq := nbLines even
		ifTrue: [ nbLines / 2 ]
		ifFalse: [ (nbLines + 1) / 2 ].
	colTheoriq < nbCols
		ifTrue: [ add := nbCols - colTheoriq ].
	^ nbLines + add
]

{ #category : 'landscape indices' }
CMSpaceModel >> dominance: attribute [
	"Compute dominance according to the attribute"

	| numberCells sum n pi classes |
	numberCells := self line * self column.
	sum := 0.
	classes := (self cormasModel theCells collect: [ :a | a perform: attribute ]) asSet.
	n := classes size.
	classes
		do: [ :i | 
			pi := (self cormasModel theCells select: [ :a | (a perform: attribute) = i ]) size
				/ numberCells.
			sum := sum + (pi * pi ln) ].
	^ n ln + sum
]

{ #category : 'landscape indices' }
CMSpaceModel >> edgeDensity: aClass [
	"return the data (a number) to be recorded"

	| size |
	size := 0.
	(self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass) asSymbol)
		do: [ :a | size := size + a surround size ].
	^ size / self cormasModel theCells size
]

{ #category : 'landscape indices' }
CMSpaceModel >> edgeDensity: aClass totalArea: aNumber [
	"this method is created for cases where the totalArea is not equal to the total size of the grid"

	| size |
	size := 0.
	(self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass))
		do: [ :a | size := size + a perimeter ].
	^ size / aNumber
]

{ #category : 'private - regularCells - shapes' }
CMSpaceModel >> eightconnexe [
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue: [
			self gridCellShape: #squared.
			self createRectangularCellsFigure ].
	self nbNeighbours ~= 8
		ifTrue: [ 
			self nbCount: #eight.
			self initNeighbourhood ].
	self changed: #shapeHasChanged with: 8	"dispatch the info to all spaceInterfaces"
]

{ #category : 'accessing' }
CMSpaceModel >> elementaryEntities [
	" Answer a <Collection> of the receiver's cells "

	^ self spatialEntitiesAt: self cellClass name
]

{ #category : 'private - accessing' }
CMSpaceModel >> elementaryEntities: x [
	
	self spatialEntities
		at: self cormasModelClass cellClass name
		put: x	"(self dependents notNil and: [line * column > x size])
		ifTrue: [self vue mainInterface updateWindowName]"
]

{ #category : 'accessing' }
CMSpaceModel >> elementaryEntitiesDefaultPovs [
	
	^elementaryEntitiesDefaultPovs
		ifNil: [elementaryEntitiesDefaultPovs := OrderedCollection new]
]

{ #category : 'accessing' }
CMSpaceModel >> elementaryEntitiesDefaultPovs: anObject [
	
	elementaryEntitiesDefaultPovs := anObject
]

{ #category : 'user interface' }
CMSpaceModel >> envSpecStringFor: spatialEntityName [
	"compute the description of the environnment (for the spaceInterface title)"

	| s nb |
	
	s := (String new: 100) writeStream.
	s
		nextPutAll:
			(self isClosedEnvironment
				ifTrue: [ 'Closed ' ]
				ifFalse: [ 'Torroidal ' ]).
	(spatialEntityName = self cellClass name
		and: [ self gridCellShape ~= #irregular ])
		ifTrue: [ s
				print: self line;
				nextPutAll: ' x ';
				print: self column.
			nb := self elementaryEntities size.
			self line * self column > nb
				ifTrue: [ s
						nextPutAll: ' restricted to ';
						print: nb ].
			self nbNeighbours = #eight | (self nbNeighbours = 8)
				ifTrue: [ s nextPutAll: ' (8)' ].
			self nbNeighbours = #six | (self nbNeighbours = 6)
				ifTrue: [ s nextPutAll: ' (6)' ].
			self nbNeighbours = #four | (self nbNeighbours = 4)
				ifTrue: [ s nextPutAll: ' (4)' ] ]
		ifFalse: [ s
				print:
					(self cormasModel
						perform: (self cormasModel getterForEntityClass: spatialEntityName))
						size ].
	s nextPutAll: '  '.
	^ s contents
]

{ #category : 'landscape indices' }
CMSpaceModel >> euclideanDistanceFromCell: cell1 toCell: cell2 [
	"return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"

	| nbLines nbCols |
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	self isClosedEnvironment
		ifFalse: [ nbLines > (self line - 2)
				ifTrue: [ nbLines := nbLines - self line + 2 ].
			nbCols > (self column - 2)
				ifTrue: [ nbCols := nbCols - self column + 2 ] ].
	^ (nbLines squared + nbCols squared) sqrt
]

{ #category : 'import - export' }
CMSpaceModel >> exportAggregateClass: class separator: aChar filename: aStringOrFileName [
	"Creates in maps directory a file named 'class.agg' which contains lines representing each intance of class 'class'. 
Each line contains the id of the instance as first element and the id of all its components separated by aChar"
	
	| stream filePath |
	(aStringOrFileName isString and: [aStringOrFileName isEmpty])
		ifFalse:
			[aStringOrFileName isString
				ifTrue:
					[filePath := (Cormas mapsPath: self cormasModelClass name) construct:
							aStringOrFileName]
				ifFalse: [filePath := aStringOrFileName].
			stream := filePath asFilename writeStream.
			(self spatialEntities notNil
				and:
					[self spatialEntities isEmpty not
						and:
							[(self spatialEntities includesKey: class name)
								and: [(self spatialEntities at: class name) isEmpty not]]])
				ifTrue:
					[(self spatialEntities at: class name)
						do:
							[:a | stream nextPutAll: ((a stringWithSeparator: aChar) , '\') withCRs]].
			stream close]
]

{ #category : 'import - export' }
CMSpaceModel >> exportAttribute: attributeName fromClass: className [
	
	| stream filename |
	filename := (Cormas mapsPath: self cormasModelClass name)
		construct: className asString , attributeName asString , '.txt'.
	stream := filename asFilename writeStream.
	(self spatialEntities notNil
		and:
			[self spatialEntities isEmpty not
				and:
					[(self spatialEntities includesKey: className)
						and: [(self spatialEntities at: className) isEmpty not]]])
		ifTrue:
			[(self spatialEntities at: className)
				do:
					[:a | 
					stream
						store: (a perform: attributeName);
						cr]].
	stream close
]

{ #category : 'private - import - export' }
CMSpaceModel >> exportToMapInfo: attributes inFile: file [
	
	| stream firstValue firstPatch dicoAttConv patch a c collec |
	stream := file asFilename writeStream.
	stream nextPutAll: 'num,'.
	dicoAttConv := Dictionary new.
	attributes
		do:
			[:att | 
			firstPatch := self elementaryEntities
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[firstValue isNumber
						ifTrue:
							[dicoAttConv
								at: att asSymbol
								put: #printString]
						ifFalse:
							[firstValue isString
								ifTrue:
									[dicoAttConv
										at: att asSymbol
										put: #asString]
								ifFalse:
									[dicoAttConv
										at: att asSymbol
										put: #printString]]].
			stream
				nextPutAll: att;
				nextPutAll:
						(att = attributes last
								ifFalse: [',']
								ifTrue: ['\' withCRs])].
	collec := Cormas
		sort: self elementaryEntities
		byIncreasing: #rowNumber
		thenByIncreasing: #columnNumber.
	1
		to: collec size - 1
		do:
			[:i | 
			patch := collec at: i.
			stream nextPutAll: i printString , ','.
			attributes
				do:
					[:att | 
					a := att asSymbol.
					c := dicoAttConv at: a.
					stream
						nextPutAll: ((patch perform: a) perform: c);
						nextPutAll:
								(att = attributes last
										ifFalse: [',']
										ifTrue: ['\' withCRs])]].
	patch := self elementaryEntities last.
	stream nextPutAll: collec size printString , ','.
	attributes
		do:
			[:att | 
			a := att asSymbol.
			c := dicoAttConv at: a.
			stream
				nextPutAll: ((patch perform: a) perform: c);
				nextPutAll:
						(att = attributes last
								ifFalse: [',']
								ifTrue: [''])].
	stream close
]

{ #category : 'private - display' }
CMSpaceModel >> findIndexForEntityClass: entityClass id: entityId in: someEntities [
	"sent by a remote spaceInterface to identify a specific entity identified by its id and class among a 
	collection of local entities"
	
	^someEntities
		findFirst:
			[:e | 
			e
				ifNil: [false]
				ifNotNil: [e id = entityId and: [e class = entityClass]]]
]

{ #category : 'private - regularCells - shapes' }
CMSpaceModel >> fourconnexe [
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue: [
			self gridCellShape: #squared.
			self createRectangularCellsFigure ].
	self nbNeighbours ~= #four
		ifTrue: [ 
			self nbCount: #four.
			self initNeighbourhood ].
	self changed: #shapeHasChanged with: 4	"dispatch the info to other spaceInterfaces"
]

{ #category : 'landscape indices' }
CMSpaceModel >> fractalDimension: aClass [
	| aCollection aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	aCollection := aggregates
		collect: [ :a | Array with: a size ln with: (a perimeter / 4) ln ].
	^ ((Cormas linearRegression: aCollection) at: 2) * 2
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getAggregatesFrom: baseEntity attribute: attributeName [
	"Return a collection of sets of contiguous components holding the same attributeName value"

	| newCollection seed setOfComponents neighbours newNeighbours theLLEntities |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	newCollection := OrderedCollection new.
	theLLEntities := ((self cormasModel
		perform: (self cormasModel getterForEntityClass: baseEntity))
		select: [ :c | (c perform: attributeName) isNil not ]) copy
		asOrderedCollection.
	[ theLLEntities isEmpty ]
		whileFalse: [ setOfComponents := Set new.
			seed := theLLEntities first.
			setOfComponents add: seed.
			neighbours := seed neighbourhood
				select: [ :v | (v perform: attributeName) = (seed perform: attributeName) ].
			[ neighbours isEmpty ]
				whileFalse: [ setOfComponents addAll: neighbours.
					newNeighbours := Set new.
					neighbours
						do: [ :v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select: [ :u | 
											(u perform: attributeName) = (seed perform: attributeName)
												and: [ (setOfComponents includes: u) not ] ]) ].
					neighbours := newNeighbours ].
			newCollection add: setOfComponents.
			setOfComponents do: [ :c | theLLEntities remove: c ] ].
	^ newCollection
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getAggregatesFrom: baseEntity verifying: aBlock [

	| selector eeInstances set seed neighbours newNeighbours collec |
	
	self isClosedEnvironment ifFalse: [ ^ self warningBoundaries ].
	
	selector := self cormasModel getterForEntityClass: baseEntity.
		
	eeInstances := ((self cormasModel perform: selector)
		select: [ :c | aBlock value: c ]) copy asOrderedCollection.
		
	collec := OrderedCollection new.	"collec est une collection de set (composants des agregats)"
		
	[ eeInstances isEmpty ]
		whileFalse: [ set := IndexedSet new.
			seed := eeInstances first.
			set add: seed.
			neighbours := seed neighbourhood select: [ :v | aBlock value: v ].
			[ neighbours isEmpty ]
				whileFalse: [ set addAll: neighbours.
					newNeighbours := IndexedSet new.
					neighbours
						do: [ :v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select: [ :u | (aBlock value: u) and: [ (set includes: u) not ] ]) ].
					neighbours := newNeighbours ].
			set do: [ :c | eeInstances remove: c ].
			collec add: set ].
		
	^ collec
]

{ #category : 'private - accessing' }
CMSpaceModel >> getInstanceOfClass: aClass fromId: anId [
	
	^ (self spatialEntities isNil or: [ self spatialEntities isEmpty or: [
			(self spatialEntities includesKey: aClass name) not or: [(self spatialEntities at: aClass name) isEmpty]]])
		ifTrue: [ nil]
		ifFalse: [ 
			(self spatialEntitiesAt: aClass name)
				detect: [:i | i id = anId]
				ifNone: [nil]]
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity attribute: attributeName [
	"Return a collection of sets of contiguous components holding the same attributeName value"
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with: [:be :getAttribute :x | (be perform: getAttribute) isNil not]
				with:
					[:be :seed :getAttribute :x | (be perform: getAttribute) = (seed perform: getAttribute)]
				with:
					[:be :setOfContiguousBe :seed :getAttribute :x | 
					(be perform: getAttribute) = (seed perform: getAttribute)
						and: [(setOfContiguousBe includes: be) not]])
		conditionalArguments: (Array with: attributeName with: nil)
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity attribute: attributeName1 attribute: attributeName2 [
	"Return a collection of sets of contiguous components holding the same value for both attributes"
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with:
					[:be :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) isNil not
						and: [(be perform: getAttribute2) isNil not]]
				with:
					[:be :seed :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) = (seed perform: getAttribute1)
						and: [(be perform: getAttribute2) = (seed perform: getAttribute2)]]
				with:
					[:be :setOfContiguousBe :seed :getAttribute1 :getAttribute2 | 
					(be perform: getAttribute1) = (seed perform: getAttribute1)
						and:
							[(be perform: getAttribute2) = (seed perform: getAttribute2)
								and: [(setOfContiguousBe includes: be) not]]])
		conditionalArguments: (Array with: attributeName1 with: attributeName2)
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity attribute: attributeName excludingValue: aValue [
	"Return a collection of sets of contiguous components holding the same attributeName value"
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with:
					[:be :getAttribute :x | 
					(be perform: getAttribute) isNil not
						and: [(be perform: getAttribute) ~= aValue]]
				with:
					[:be :seed :getAttribute :x | (be perform: getAttribute) = (seed perform: getAttribute)]
				with:
					[:be :setOfContiguousBe :seed :getAttribute :x | 
					(be perform: getAttribute) = (seed perform: getAttribute)
						and: [(setOfContiguousBe includes: be) not]])
		conditionalArguments: (Array with: attributeName with: nil)
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity conditionalBlocks: blocks conditionalArguments: arguments [
	"Return a collection of sets of contiguous components"

	| collec seed setOfContiguousComponents neighbours newNeighbours baseEntities valuesB2 valuesB3 |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	baseEntities := ((self spatialEntitiesAt: baseEntity name)
		select:
			[ :c | blocks first value: c value: arguments first value: arguments last ])
		copy asOrderedCollection.
	collec := OrderedCollection new.
	[ baseEntities isEmpty ]
		whileFalse: [ setOfContiguousComponents := Set new.
			seed := baseEntities first.
			setOfContiguousComponents add: seed.
			neighbours := seed neighbourhood
				select: [ :v | 
					valuesB2 := Array new: 4.
					valuesB2 at: 1 put: v.
					valuesB2 at: 2 put: seed.
					valuesB2 at: 3 put: arguments first.
					valuesB2 at: 4 put: arguments last.
					(blocks at: 2) valueWithArguments: valuesB2 ].
			[ neighbours isEmpty ]
				whileFalse: [ setOfContiguousComponents addAll: neighbours.
					newNeighbours := Set new.
					neighbours
						do: [ :v | 
							newNeighbours
								addAll:
									(v neighbourhood
										select: [ :u | 
											valuesB3 := Array new: 5.
											valuesB3 at: 1 put: u.
											valuesB3 at: 2 put: setOfContiguousComponents.
											valuesB3 at: 3 put: seed.
											valuesB3 at: 4 put: arguments first.
											valuesB3 at: 5 put: arguments last.
											blocks last valueWithArguments: valuesB3 ]) ].
					neighbours := newNeighbours ].
			collec add: setOfContiguousComponents.
			setOfContiguousComponents do: [ :c | baseEntities remove: c ] ].
	^ collec
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity horizontalDividers: i verticalDividers: j [
	
	| nbLG nbCG nbLP nbCP zone allComponents collec |
	"dimensions de la grille"
	nbLG := line.
	nbCG := column.	"dimensions d'une partition"
	nbLP := nbLG / j.
	nbCP := nbCG / i.	"calcul sous-grille de chaque cellule"
	allComponents := Dictionary new.
	1
		to: i * j
		do:
			[:n | 
			allComponents
				at: n
				put: OrderedCollection new].
	(self spatialEntitiesAt: baseEntity name)
		do:
			[:cc | 
			line := (cc id / nbCG) ceiling.
			column := cc id - ((line - 1) * nbCG).
			zone := nbCG / nbCP * ((line / nbLP) ceiling - 1)
				+ (column / nbCP) ceiling.
			(allComponents at: zone) add: cc].
	collec := OrderedCollection new.
	1
		to: allComponents size
		do: [:n | collec add: (allComponents at: n)].
	^collec
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity verifying: aBlock [
	
	^self
		getSetsOfContiguous: baseEntity
		conditionalBlocks:
			(Array
				with: [:be :x1 :x2 | aBlock value: be]
				with: [:be :x1 :x2 :x3 | aBlock value: be]
				with:
					[:be :setOfContiguousBe :x1 :x2 :x3 | (aBlock value: be) and: [(setOfContiguousBe includes: be) not]])
		conditionalArguments: (Array with: nil with: nil)
]

{ #category : 'private - accessing' }
CMSpaceModel >> gridCellShape [
	
	^gridCellShape
]

{ #category : 'private - accessing' }
CMSpaceModel >> gridCellShape: x [
	" This is not needed anymore, it is already provided by CMSpaceNeighourhood "

	gridCellShape := x
]

{ #category : 'accessing' }
CMSpaceModel >> gridSize [
	" Answer the <Number> of cells of the grid "

	^ gridSize
		ifNil: [ gridSize := self defaultGridSize ]

]

{ #category : 'private - accessing' }
CMSpaceModel >> gridSize: anInteger [
	gridSize := anInteger.
	arrayOrigins := Array new: anInteger
]

{ #category : 'private - regularCells - shapes' }
CMSpaceModel >> hexagonal [
	" Received from SpaceInterface menu, when the user want to change the shape of the cells "

	self gridCellShape ~= #hexagonal ifFalse: [ ^ self ].
	self gridCellShape: #hexagonal.
	self nbCount: #six.
	self createHexagonalCellsFigure.
	self initNeighbourhood.
	self changed: #shapeHasChanged
]

{ #category : 'printing' }
CMSpaceModel >> humanReadableString [
	" Answer a <String> with receiver's details suitable for titles "
	
	^ String streamContents: [ : stream |
		stream
			space;
			<< self line asString;
			<< $x;
			<< self column asString;
			<< $(;
			<< self gridSize asString;
			<< $);
			space;
			<< self gridCellShape asString ]

		
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> initAggregates: compoundEntity fromSeeds: aCollec [
	"Create N aggregates from a collection of N cells. 
	The new aggregates are only composed of one cell (the seed); their 'givenSize' attribut value is determine by the distribution.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> "

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollec first class.
	aCollec
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifFalse: [ self createSilentlyAggregate: compoundEntity from: (Set with: s) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> initAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution [
	"Create N spatial aggregates from a collection of N cells according to a size distribution. 
	The new aggregates are only composed of one cell (the seed); their 'givenSize' attribut value is determine by the distribution.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> 
	this method is supposed to receive a size distribution 
	aDistribution = Collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s. 

	Ex: to generate 3 aggregates size 1, 5 aggregates size 2, and 2 aggregates size 3, this has to be (#(3 1) #(5 2) #(2 3)). 
	This method uses the attribute called givenSize defined for SpatialEntityAggregate"

	| counter subsetIndice |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollecOfCells first class.
	((aDistribution collect: [ :pair | pair first ])
		inject: 0
		into: [ :sum :i | sum + i ]) ~= aCollecOfCells size
		ifTrue: [ self
				error: 'the number of seeds is different from the number of aggregates !!!' ].
	counter := 0.
	subsetIndice := 1.
	aCollecOfCells
		do: [ :cell | 
			(cell isComponentOf: compoundEntity)
				ifFalse: [ (self
						createSilentlyAggregate: compoundEntity
						from: (OrderedCollection with: cell))
						givenSize: (aDistribution at: subsetIndice) last.
					counter := counter + 1.
					counter = (aDistribution at: subsetIndice) first
						ifTrue: [ counter := 0.
							subsetIndice := subsetIndice + 1 ] ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceModel >> initNeighbourhood [
	" Private - Initalize the receiver's neighbourhood "

	self elementaryEntities do: #initNeighbourhood.

]

{ #category : 'initialization' }
CMSpaceModel >> initialize [
	super initialize.
	self resetSpatialEntities.
	
	isClosedEnvironment := self class defaultIsClosedEnvironment
]

{ #category : 'private - init' }
CMSpaceModel >> initializeIrregular [
	
	gridCellShape := #irregular.
	isClosedEnvironment := true.
	line := nil.
	column := nil.
	gridSize := 0	"arrayOrigins := Array new: cardinal."
]

{ #category : 'ESE initialize-release' }
CMSpaceModel >> initializeRegularLines: lines columns: columns nbType: aNumber closed: aBoolean [
	" Private - Create a grid of regular cells.

	lines = number of lines. 
	columns = number of columns.
	aBoolean = <Boolean> (true for closed, false for toroidal).
	ex, from CormasModel: self spaceModel initializeRegularColumns: 101 lines: 101 toroidal: true."

	self resetSpatialEntities.
	self line: lines column: columns.
	isClosedEnvironment := aBoolean.
	self nbCount: aNumber.
	self createCells.


]

{ #category : 'private - accessing' }
CMSpaceModel >> isClosedEnvironment [
	"Open environment is torroidal. If you go over the edge, you come back from the other side
	Closed environment is not torroidal. The edges have 'walls' and you can't cross them"
	
	^ isClosedEnvironment
]

{ #category : 'private - accessing' }
CMSpaceModel >> isClosedEnvironment: aBoolean [
	" Requires the receiver already has a number of neighbourhood configured "

	isClosedEnvironment = aBoolean ifTrue: [ ^ self ].
	isClosedEnvironment := aBoolean.
	self initNeighbourhood.
	self cormasModel registerSpaceModelChange: #boundariesChanged	"dispatch the info to other spaceInterfaces"
]

{ #category : 'testing' }
CMSpaceModel >> isFull [
	"Answer if the spaceModel is completely occupied by cells, meaning that some cells are missing or not "
	
	^ self gridSize = self elementaryEntities size
]

{ #category : 'testing' }
CMSpaceModel >> isIrregular [
	"Answer if the spaceModel is irregular (or regular), meaning that the cells are not uniform, but have different shapes (vectorial)"
	
	^gridCellShape = #irregular
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> isPartitionComplete: compoundEntity [
	
	^(self elementaryEntities
		anySatisfy: [:c | (c isComponentOf: compoundEntity) not]) not
]

{ #category : 'private - accessing' }
CMSpaceModel >> line [
	" Answer the <Number> of lines of the receiver's grid "
	
	^ line
		ifNil: [ line := self defaultLines ]
]

{ #category : 'private - accessing' }
CMSpaceModel >> line: i column: j [
	" Configure receiver's number of lines to be i and number of columns to be j "

	line := i.
	column := j.
	gridSize := i * j
]

{ #category : 'playback-log' }
CMSpaceModel >> logLeaveOf: anAgentLocation from: aSpatialEntity [
	"Log the fact that an agent left a spatial entity"
	"Ask the instance of Cormas"
	
	cormasModel cormas logLeaveOf: anAgentLocation from: aSpatialEntity
]

{ #category : 'playback-log' }
CMSpaceModel >> logMovementOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity [
	"Log the movement of an agent from a spatial entity to another entity"
	"Ask the instance of Cormas"
	
	cormasModel cormas logMovementOf: anAgentLocation from: srcSpatialEntity
		to: dstSpatialEntity
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerLeftLocation [
	^ self elementaryEntities at: column * (line - 1) + 1
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerRightLocation [
	^ self elementaryEntities at: column * line
]

{ #category : 'landscape indices' }
CMSpaceModel >> meanCompactness: aClass [

	| selector aggregates sum |
	
	selector := self cormasModel getterForEntityClass: aClass.
	aggregates := self cormasModel perform: selector.
	
	aggregates ifEmpty: [ ^ 0 ].
		
	sum := aggregates sum: [ :each | each updateCompactness ].
	^ sum / aggregates size
]

{ #category : 'landscape indices' }
CMSpaceModel >> meanNearestNeighbourDistanceAggregate: aClass attribute: anAttribute [
	"loop on the aggregates with same attribute and select the minimum distance. If the attribute is nil it means that there is only one type of aggregates"

	| classes n sum collec distMin dist aggregates a b |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	classes := anAttribute isNil
		ifFalse: [ (aggregates collect: [ :ag | ag perform: anAttribute ]) asSet ]
		ifTrue: [ aggregates ].
	n := classes size.
	n < 2
		ifTrue: [ ^ 0 ].
	sum := 0.
	classes
		do: [ :i | 
			collec := anAttribute isNil
				ifFalse: [ aggregates select: [ :ag | (ag perform: anAttribute) = i ] ]
				ifTrue: [ aggregates ].
			distMin := 10000000.
			1 to: collec size do: [ :k | 
				a := collec at: k.
				k + 1 to: collec size do: [ :j | 
					b := collec at: j.
					b ~= a
						ifTrue: [ dist := a distSurroundAggregatePixel: b.
							distMin := distMin min: dist ] ] ].
			sum := sum + distMin ].
	^ sum / n
]

{ #category : 'landscape indices' }
CMSpaceModel >> meanPatchSize: aClass [
	"return the data (a number) to be recorded"

	| size aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	size := 0.
	aggregates do: [ :a | size := size + a components size ].
	^ size / aggregates size
]

{ #category : 'landscape indices' }
CMSpaceModel >> nPatches: aClass [
	"return the data (a number) to be recorded"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size
]

{ #category : 'accessing' }
CMSpaceModel >> nbConfiguration [
	^ nbConfiguration
]

{ #category : 'accessing' }
CMSpaceModel >> nbConfiguration: aCMSpaceNeighbourhood [ 

	nbConfiguration := aCMSpaceNeighbourhood
]

{ #category : 'accessing' }
CMSpaceModel >> nbCount: anIntegerOrSymbol [
	" Set the receiver's neighbourhood configuration to contain anIntegerOrSymbol neighbours "
	
	self nbConfiguration: (CMSpaceNeighbourhood forNeighbours: anIntegerOrSymbol spaceModel: self)

]

{ #category : 'landscape indices' }
CMSpaceModel >> nbDistinctValuesOf: anAttribute [
	"Return the number of different values for anAttribute"

	^ (self cormasModel theCells collect: [ :a | a perform: anAttribute ]) asSet size
]

{ #category : 'private - accessing' }
CMSpaceModel >> nbNeighbours [
	" Answer a <Number> representing the receiver configured number of neighbours of regular cells "

	^ self nbConfiguration nbNeighbours
]

{ #category : 'accessing' }
CMSpaceModel >> nearestEmptyCellFor: aCMAgentLocation [

	^ self nbConfiguration nearestEmptyCellFor: aCMAgentLocation.
]

{ #category : 'landscape indices' }
CMSpaceModel >> nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2 [
	"return the data (a number) to be recorded"
	
	| c1 c2 |
	c1 := self cormasModel theCells select: [:a | (a perform: anAttribute) = x1].
	c2 := c1 select: [:a | a neighbourhood anySatisfy: [:b | (a perform: anAttribute) = x2 ] ].
	^ c2 size / c1 size
]

{ #category : 'private - init' }
CMSpaceModel >> newEntity: aClass [
	" Creates a new instance of aClass and collects it at the level of theXXXs collection. 
	Set also the collector of the new instance"

	^ (aClass new: self)
		cormasModel: self cormasModel;
		"anEntity collector: self cormasModel collector.
	self cormasModel collect: anEntity."
			yourself
]

{ #category : 'private - irregular polygons aggregation' }
CMSpaceModel >> outlineAggregatedFrom: listPolygons [
	
	| newOutline voisinsConcernes listeNoeuds newSegment listeSegments followingSegment |
	listeSegments := OrderedCollection new.
	newOutline := OrderedCollection new.
	listPolygons
		do:
			[:poly1 | 
			listeNoeuds := OrderedCollection new.
			voisinsConcernes := poly1 neighbourhood
				select: [:v | listPolygons includes: v].
			voisinsConcernes isEmpty ifTrue: [self halt].
			voisinsConcernes
				do:
					[:v | 
					listeNoeuds
						add: (poly1 nodes at: v) first;
						add: (poly1 nodes at: v) last].
			listeNoeuds := listeNoeuds asSortedCollection asOrderedCollection.
			listeNoeuds
				addLast: listeNoeuds first;
				remove: listeNoeuds first.
			1
				to: listeNoeuds size
				by: 2
				do:
					[:i | 
					newSegment := OrderedCollection new.
					((listeNoeuds at: i + 1) < (listeNoeuds at: i)
						and:
							[(listeNoeuds at: i) ~= poly1 outline size | ((listeNoeuds at: i + 1) ~= 1)])
						ifTrue:
							[(listeNoeuds at: i)
								to: poly1 outline size - 1
								do: [:ii | newSegment add: (poly1 outline at: ii)].
							1
								to: (listeNoeuds at: i + 1)
								do: [:ii | newSegment add: (poly1 outline at: ii)]].
					(listeNoeuds at: i + 1) > (listeNoeuds at: i)
						ifTrue:
							[(listeNoeuds at: i)
								to: (listeNoeuds at: i + 1)
								do: [:ii | newSegment add: (poly1 outline at: ii)]].
					newSegment isEmpty ifFalse: [listeSegments add: newSegment]]].
	newOutline := listeSegments first.
	[newOutline first = newOutline last]
		whileFalse:
			[followingSegment := listeSegments
				detect: [:s | s first = newOutline last]
				ifNone: [nil].
			followingSegment isNil
				ifTrue: [self halt]
				ifFalse:
					[followingSegment removeFirst.
					newOutline addAll: followingSegment]].
	^newOutline
]

{ #category : 'landscape indices' }
CMSpaceModel >> patchDensity: aClass [
	"return the data (a number) to be recorded"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size / (self column * self line)
]

{ #category : 'landscape indices' }
CMSpaceModel >> patchDensity: aClass totalArea: aNumber [
	"this method is created for cases where the totalArea is not equal to the total size of the grid"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size / aNumber
]

{ #category : 'printing' }
CMSpaceModel >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream << self humanReadableString.

		
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> randomCell [
	"Purpose: Return a spatialEntityElement (aCell) picked randomly from the spatial grid."

	^ Cormas selectRandomlyFrom: self elementaryEntities
]

{ #category : 'ESE initialize-release' }
CMSpaceModel >> release [
	
	self dependents
		do:
			[:spv | 
			spv closeAndUnschedule.
			spv release].
	super release	"	self spatialEntities notNil ifTrue: [self spatialEntities do: [:aCollec | aCollec do: [:e | e release]]]"	"-> Mis en commantaire car les entit√©s n''ont plus de dependents'"
]

{ #category : 'private - init' }
CMSpaceModel >> release: aClass [
	
	super release.
	(self spatialEntitiesAt: aClass name) do: [:e | e spaceModel: nil]
]

{ #category : 'accessing' }
CMSpaceModel >> resetCompoundSpatialEntity: compoundClass [

	(self spatialEntitiesAt: compoundClass name)
		do: [: agg | agg components do:[: c | (c theAggregates includesKey: compoundClass name)
				ifTrue: [c theAggregates at: compoundClass name put: nil]]].
	self spatialEntitiesAt: compoundClass name put: OrderedCollection new.
	self cormasModel resetEntities: compoundClass.
	"self changed: #createRegularAggregatesImagesFor: with: compoundClass"
]

{ #category : 'private - init' }
CMSpaceModel >> resetCompoundSpatialEntity: compoundClass andTheirComponents: componentClass [
	
	(self spatialEntitiesAt: componentClass name)
		do: [:c | (c theAggregates includesKey: compoundClass name)
				ifTrue: [
					c theAggregates
						at: compoundClass name
						put: nil]].
	self spatialEntitiesAt: compoundClass name put: OrderedCollection new.
	self cormasModel resetEntities: compoundClass	"self changed: #createRegularAggregatesImagesFor: with: compoundClass"
]

{ #category : 'private - init' }
CMSpaceModel >> resetSpatialEntities [
	
	| newColl |
	self spatialEntities: Dictionary new. 
	self cormasModel ifNil: [ ^nil ].
	self cormasModelClass spatialClasses do: [ : aSpatialClass | 
			newColl := self cormasModel resetEntities: aSpatialClass.
			self spatialEntitiesAt: aSpatialClass name 	put: newColl ].
	"self changed: #removeAllFigures"	"all the figures of the spaceInterfaces have to be deleted"
]

{ #category : 'private - init' }
CMSpaceModel >> resetSpatialEntitiesButCells [
	
	| theCells |
	self spatialEntities isEmpty ifTrue: [ ^ nil ].
	theCells := self elementaryEntities.
	self aggregatesEntities do: [ : agg | 
			agg
				reset;
				destroyed: true].
	self changed: #removeAllCompoundSpatialEntityFigures.
	self spatialEntities: Dictionary new.
	self cormasModel class spatialClasses do: [ : se | 
			se name = self cormasModel class cellClass name
				ifTrue: [ self spatialEntitiesAt: se name 	put: theCells ]
				ifFalse: [ self spatialEntitiesAt: se name put: OrderedCollection new.
					"RemotableOrderedCollection new. ** changed to OrderedCollection new. (RemotableOrderedCollection is used for marshalling in remote distributed visualization)" 
					self cormasModel resetEntities: se ] ]
]

{ #category : 'CSE (general) - import - export' }
CMSpaceModel >> saveNeighboorsClass: class separator: aChar [
	"Creates in maps directory a file named 'class_Neighboors.agg' which contains lines representing each intance of class 'class'. 
Each line contains the id of the instance as first element and the id of all its neighboors separated by aChar"
	
	| stream filename |
	filename := (Cormas mapsPath: self cormasModelClass name) construct: class name asString , '_Neighboors.agg'.
	stream := filename asFilename writeStream.
	(self spatialEntities notNil and: [self spatialEntities isEmpty not
		and: [ (self spatialEntities includesKey: class name) and: [(self spatialEntities at: class name) isEmpty not]]])
			ifTrue: [(self spatialEntitiesAt: class name) do: [ : a | stream nextPutAll: ((a neighborsStringWithSeparator: aChar) , '\') withCRs]].
	stream close
]

{ #category : 'private - absoluteWorld' }
CMSpaceModel >> setAbsoluteBounds [
	"the absolute default space is a square space of 50x50 pixels. It has been defined for a 10x10 cells space.
It is never display, only copied by the SpaceViews.
It can be modified (setAbsoluteBounds) when for exemple there is 3 lines and 10 column. Then, absoluteBounds = 3/10 * 50 @ 50 pixels"
	
	| absoluteWidth absoluteHeight |
	absoluteBounds := nil.
	absoluteWidth := self absoluteBounds width * self column.
	absoluteHeight := self absoluteBounds height * self line.
	self absoluteBounds: (Rectangle
			origin: 0 @ 0
			extent: absoluteWidth @ absoluteHeight)
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName [
	"The aggregates occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	(self getAggregatesFrom: baseEntity attribute: attributeName)
		do: [ :set | self createSilentlyAggregate: compoundEntity from: set ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName1 attribute: attributeName2 [
	"The aggregates occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	(self
		getSetsOfContiguous: baseEntity
		attribute: attributeName1
		attribute: attributeName2)
		do: [ :set | self createSilentlyAggregate: compoundEntity from: set ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName excludingValue: aValue [
	"The aggregates do not occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	aValue is a specific value of the attribute, for instance #notDefined, or 0
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	(self
		getSetsOfContiguous: baseEntity
		attribute: attributeName
		excludingValue: aValue)
		do: [ :set | self createSilentlyAggregate: compoundEntity from: set ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity horizontalDividers: xRatio verticalDividers: yRatio [
	"Creates (xRatio x yRatio) aggregates by dividing the grid by yRatio columns and xRatio lines.
The aggregates will  occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	(self
		getSetsOfContiguous: baseEntity
		horizontalDividers: xRatio
		verticalDividers: yRatio)
		do: [ :set | self createSilentlyAggregate: compoundEntity from: set ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity verifying: aBlock [
	"baseEntity = a subClass of  <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>
This method resets all aggregats 'compoundEntity' and rebuids them"
	
	^self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms [
	"baseEntity = a subClass of  <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>
ms= <integer> must be >= 1
This method resets all aggregats 'compoundEntity' and rebuids them"
	
	self resetCompoundSpatialEntity: compoundEntity andTheirComponents:
			baseEntity.
	^self buildAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> setAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> setAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity minimumSize: ms [
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms
]

{ #category : 'private - irregular polygons aggregation' }
CMSpaceModel >> setAggregatsBounds: agregat [
	
	| origin corner aComponent |
	(self spatialEntitiesAt: agregat name) do: [ : ag | 
			aComponent := ag components asOrderedCollection first.
			origin := aComponent bounds origin.
			corner := aComponent bounds corner.
			ag components do: [ : b | 
				origin := b bounds origin min: origin.
				corner := b bounds corner max: corner].
			ag bounds: (Rectangle origin: origin corner: corner)]
]

{ #category : 'accessing' }
CMSpaceModel >> setBoundaryDirectionsFor: aCMSpatialEntity [
	" Answer a <Collection> of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"

	^ self nbConfiguration setBoundaryDirectionsFor: aCMSpatialEntity
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> setBounds: allPolygons [
	
	| entity origin corner |
	allPolygons isEmpty ifTrue: [^nil].
	entity := allPolygons first class.
	origin := allPolygons first bounds origin.
	corner := allPolygons first bounds corner.
	allPolygons
		do:
			[:b | 
			origin := b bounds origin min: origin.
			corner := b bounds corner max: corner].
	entity bounds: (Rectangle origin: origin corner: corner)
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntities: compoundEntity from: baseEntity attribute: attributeName [
	"baseEntity = a Class name inheriting from <SpatialEntity>	
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| fragmentedEntity beInstances collec |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	beInstances := (self cormasModel
		perform: (self cormasModel getterForEntityClass: baseEntity)) copy
		asOrderedCollection.
	[ beInstances isEmpty ]
		whileFalse: [ collec := beInstances
				select: [ :c | 
					(beInstances first perform: attributeName)
						= (c perform: attributeName) ].
			beInstances removeAll: collec.
			fragmentedEntity := compoundEntity new: self.
			fragmentedEntity addSilentlyComponents: collec.
			fragmentedEntity type: (collec first perform: attributeName).
			(self spatialEntitiesAt: compoundEntity name)
				add: fragmentedEntity ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntities: compoundEntity from: baseEntity verifying: aBlock [
	"baseEntity = a Class name inheriting from <SpatialEntity>
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	aBlock (example = [:cell | cell isTree] or [:aggregat | aggregat type = #forest] ) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| getter fragmentedEntity beInstances |
	
	self isClosedEnvironment ifFalse: [ ^ self warningBoundaries ].
	
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
		
	getter := self cormasModel getterForEntityClass: baseEntity.
	
	beInstances := ((self cormasModel perform: getter)
		select: [ :c | aBlock value: c ]) copy asOrderedCollection.
			
	fragmentedEntity := compoundEntity new: self.
	fragmentedEntity addSilentlyComponents: beInstances.
	
	(self spatialEntitiesAt: compoundEntity name) add: fragmentedEntity.
	self dispatchCompoundSpatialEntity: compoundEntity.
	
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement [
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| aSet |
	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollecOfSpatialEntityElement first class.
	aSet := Set new.
	aCollecOfSpatialEntityElement
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifTrue: [ aSet add: s ] ].
	self createSilentlyAggregate: compoundEntity from: aSet.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'private - regular polygons' }
CMSpaceModel >> setGivenSizes: dis toAggregates: compoundEntity [
	"dis is an array of pair-values: #(#(X1 GS1) #(X2 GS2) ... #(Xi GSi))"
	"Xi and GSi are integers, respectively a number of aggregates and the givenSize for these aggregates"
	"Ex: you want to generate 3 aggregates size 1, 5 size 2, and 2 size 3. dis should be #(#(3 1) #(5 2) #(2 3))"
	"The sum of all Xi should be the same than aCollec size"
	
	| aCollec counter subsetIndice |
	aCollec := self spatialEntitiesAt: compoundEntity name.
	((dis collect: [:pair | pair first])
		inject: 0
		into: [:sum :i | sum + i]) ~= aCollec size
		ifTrue: [self error: 'Inconsistency in the number of aggregates !!!'].
	counter := 0.
	subsetIndice := 1.
	aCollec do: [ : s | 
		s givenSize: (dis at: subsetIndice) last.
		counter := counter + 1.
		counter = (dis at: subsetIndice) first
			ifTrue: [
				counter := 0.
				subsetIndice := subsetIndice + 1]]
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setGridAsAggregat: compoundEntity [
	"Creates one instance of compoundEntity from all the cells <SpatialEntityElement> of the grid.
	This method resets all aggregats 'compoundEntity' and rebuids them.
	compoundEntity : a Class name inheriting from <SpatialEntitySet>"
	
	^self
		setAggregates: compoundEntity
		from: self cormasModelClass cellClass
		verifying: [:c | true]
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> setIrregularEntitiesEdge [

	| outlineTempo |
	self elementaryEntities isEmpty ifTrue: [ ^ self halt ].
	self elementaryEntities do: [ :aCell | 
		aCell neighbourhood ifNil: [ ^ self halt ].
		(aCell neighbourhood anySatisfy: [ :neigh | neigh edge ~= false ])
			ifFalse: [ aCell edge: false ]
			ifTrue: [ 
				outlineTempo := aCell outline copy.
				aCell neighbourhood do: [ :c | 
					outlineTempo removeAllSuchThat: [ :point | 
						c outline includes: point ] ].
				aCell edge: outlineTempo isNotEmpty ] ]
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> setPartitionsFrom: baseEntity attribute: attributeName into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity attribute:
			attributeName
]

{ #category : 'private - regular polygons - deprecated' }
CMSpaceModel >> setPartitionsFrom: baseEntity xRatio: i yRatio: j into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity horizontalDividers: i
		verticalDividers: j
]

{ #category : 'CSE (regular) - instance creation' }
CMSpaceModel >> setSingletonAggregates: compoundEntity fromSeeds: aCollec [
	"create n (aCollec size) aggregates made of a single component which is an element of aCollec.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"

	self isClosedEnvironment
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollec first class.
	aCollec
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifFalse: [ self createSilentlyAggregate: compoundEntity from: (Set with: s) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntitiesAt: compoundEntity name
]

{ #category : 'parsing' }
CMSpaceModel >> setUncompleteGridFromData: aMatrix forAttributes: listAttr_type [
	"lecture des valeurs des attributs, et maj des entites spatiales a partir de ces valeurs"
	"balayage de gauche a droite et de bas en haut"
	"Lecture de la 5e ligne: noms des attributs et leur type pour conversion"
	
	| i  aCell valeur anID livingCells allCells |
	
	livingCells := OrderedCollection new.
	listAttr_type removeFirst.
	aMatrix
		do:
			[:aLine |  |aColl|
			i := 0.
			aLine removeAllSuchThat: [:v | v isNil].
			aLine first isCollection 
				ifFalse:[aLine size = 1 ifTrue:[aColl := Cormas splitString: aLine first printString with: $. .
aColl at: 1 put: aColl first asNumber. aColl at: 2 put: aColl last asNumber. ]] "pb avec , et . qui ont été retranscrits en ."
				ifTrue:[ aColl := (Cormas splitString: aLine first with: $, )].
			anID := aColl first asNumber. aColl removeFirst.
			aCell := self elementaryEntities detect: [:c | c id = anID].
			livingCells add: aCell.
			aColl do: [:val | |attr_type|
					i := i + 1.	
					valeur := val.
					attr_type := listAttr_type at: i.
					attr_type value = #asEntity
						ifTrue:
							[valeur := (valeur tokensBasedOn: $.) last asSymbol.
							aCell perform: attr_type key with: valeur]
						ifFalse:
							[aCell perform: attr_type key with:
									(valeur = 'nil'
										ifFalse: [valeur perform: attr_type value]
										ifTrue: [nil])]]].
"Killing the unecessary cells"
		allCells :=self elementaryEntities asOrderedCollection.
		allCells removeAll: livingCells.
		allCells reverseDo: [: c | c delete]
]

{ #category : 'utilities - binary storage' }
CMSpaceModel >> settingsFrom: aClone [
	" This behavior is related with restoring organization (i.e. the redo, replay, etc) in the spatial grid "

	(self absoluteBounds = aClone absoluteBounds
		and: [ self column = aClone column
				and: [ self line = aClone line
						and: [ self nbNeighbours = aClone nbNeighbours ] ] ])
		ifTrue: [ aClone isIrregular
				ifFalse: [ ^ self ] ].
	self autoResizeBounds: aClone autoResizeBounds.
	aClone isIrregular
		ifFalse: [ self
				initializeRegularLines: aClone line
				columns: aClone column
				nbType: aClone nbNeighbours
				closed: aClone isClosedEnvironment ]
]

{ #category : 'landscape indices' }
CMSpaceModel >> shannon: attribute [
	"Answer the Shannon index of the attribute of SpatialEntity suchThat:
    Ha = - SumOf [ occuranceOf(attribut) . ln(occuranceOf(attribut)) ] 
    attribute = <Symbol>"
	
	| cells totCells sum pi setOfValues |
	cells := self cormasModel theCells asArray.	"pour optimisation"
	totCells := cells size.
	totCells = 0 ifTrue: [^0].
	sum := 0.
	setOfValues := (cells collect: [:a | a perform: attribute]) asSet.
	setOfValues
		do:
			[:val | 
			pi := (cells select: [:c | (c perform: attribute) = val]) size / totCells.
			sum := sum + (pi * pi ln)].
	^sum negated
]

{ #category : 'accessing' }
CMSpaceModel >> spaceModel [
	^ self
]

{ #category : 'accessing' }
CMSpaceModel >> spatialClasses [
	"return a collection of spatial classes"

	^ self cormasModelClass spatialClasses
]

{ #category : 'private - accessing' }
CMSpaceModel >> spatialEntities [

	^ spatialEntities ifNil: [ spatialEntities := Dictionary new ]
]

{ #category : 'private - accessing' }
CMSpaceModel >> spatialEntities: aDictionary [
	" The spatial entities is a <Dictionary> of the receiver's cells "

	spatialEntities := aDictionary
]

{ #category : 'accessing' }
CMSpaceModel >> spatialEntitiesAt: aSpatialEntityName [
	^ self spatialEntities at: aSpatialEntityName
]

{ #category : 'accessing' }
CMSpaceModel >> spatialEntitiesAt: aSpatialEntityName put: anObject [

	^ self spatialEntities 
		at: aSpatialEntityName
		put: anObject
]

{ #category : 'accessing' }
CMSpaceModel >> spatialEntitiesAt: aSpatialEntityName withPovResultFor: povSelector [
	"return spatialEntities associated with their povResult for a povSelector.
	this is an optimised method sp√©cially for remote access"
	
	^(self spatialEntitiesAt: aSpatialEntityName) asOrderedCollection
		collect: [:each | each -> (each getPovResultFor: povSelector)]
]

{ #category : 'accessing' }
CMSpaceModel >> timeStep [
	^ self cormasModel timeStep
]

{ #category : 'user interface' }
CMSpaceModel >> timeUnitName [
	
	^self cormasModel timeUnitName
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> traiterAccesParticulier: val [
	
	| point listePoint |
	listePoint := self traiterChaineDeCaractere: val.
	point := (listePoint at: 1) asNumber @ (listePoint at: 2) asNumber.
	^point
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> traiterAutreChaineDeCaractere: chaine [
	"ex: chaine = '    Pen (1,2,0) '   et retourne une coll du genre : OrderedCollection ('Pen' '(1,2,0) ')  "
	
	| objet liste |
	objet := chaine copyReplaceFrom: 1 to: 4 with: ''.
	liste := self traiterChaineDeCaractere: objet.
	^liste
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> traiterChaineDeCaractere: aString [
	| spaceIndex objetGraphique nombreElement listeTemp |
	listeTemp := OrderedCollection new.
	spaceIndex := aString indexOf: Character space.
	spaceIndex = 0
		ifFalse: [ objetGraphique := aString copyFrom: 1 to: spaceIndex - 1.
			nombreElement := aString copyFrom: spaceIndex + 1 to: aString size.
			listeTemp
				add: objetGraphique;
				add: nombreElement ].
	^ listeTemp
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperLeftLocation [
	^ self elementaryEntities at: 1
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperRightLocation [
	^ self elementaryEntities at: column
]

{ #category : 'private - irregular polygons creation' }
CMSpaceModel >> voisinsPolygonesNoeuds: lesPolygones [
	| boundingRectangle p pPrec pCour allPolygones |
	lesPolygones isEmpty
		ifTrue: [ ^ self ].
	allPolygones := self cormasModel
		perform: (self cormasModel getterForEntityClass: lesPolygones first).
	lesPolygones
		do: [ :b | 
			b neighbourhood isNil
				ifTrue: [ b neighbourhoodWithNils: Set new ].
			b nodes: Dictionary new.
			boundingRectangle := Rectangle
				origin: b bounds origin
				corner: b bounds corner.
			boundingRectangle origin x: boundingRectangle origin x - 1.
			boundingRectangle origin y: boundingRectangle origin y - 1.
			boundingRectangle corner x: boundingRectangle corner x + 1.
			boundingRectangle corner y: boundingRectangle corner y + 1.
			allPolygones
				do: [ :c | 
					b ~= c
						ifTrue: [ (c bounds intersects: boundingRectangle)
								ifTrue:
									[ "c est POTENTIELLEMENT voisin... on le verifie ici rigoureusement..."
									"et par la meme occasion, on memorise les noeuds !!!"
									pPrec := c outline includes: (b outline at: 1).	"Point precedent inclus ?"
									1 to: b outline size do: [ :i | 
										p := b outline at: i.
										pCour := c outline includes: p.
										pPrec & pCour not
											ifTrue: [ b neighbourhood add: c.
												(b nodes keys includes: c)
													ifFalse: [ b nodes at: c put: OrderedCollection new ].
												(b nodes at: c)
													add:
														(i = 2
															ifFalse: [ i - 1 ]
															ifTrue: [ b outline size ]) ].	"(b nodes at: c) add: i-1]."
										pPrec not & pCour
											ifTrue: [ b neighbourhood add: c.
												(b nodes keys includes: c)
													ifFalse: [ b nodes at: c put: OrderedCollection new ].
												(b nodes at: c)
													add:
														(i = b outline size
															ifFalse: [ i ]
															ifTrue: [ 1 ]) ].	"(b nodes at: c) add: i]."
										pPrec := pCour ].
									(b nodes keys includes: c)
										ifTrue: [ b nodes at: c put: (b nodes at: c) asSortedCollection ] ] ] ] ]
]

{ #category : 'deprecated' }
CMSpaceModel >> vue [
	"en principe le modele n'a pas a manipuler directement sa vue !!!"
	
	^self dependents isEmpty
		ifTrue: [nil]
		ifFalse: [self dependents first]
]

{ #category : 'deprecated' }
CMSpaceModel >> vues [
	"DEPRECATED. Should use :"
	
	^self dependents
]

{ #category : 'landscape indices' }
CMSpaceModel >> wayFromCell: cell1 toCell: cell2 [
	"return a collection of cells from cell1 to cell2 (including cell1 and cell2)"
	
	| nbLines nbCols firstCell lastCell invert cellsIntoRectangle way |
	
	"for irregular cells, the calculus is much more longer"
	self gridCellShape = #irregular ifTrue: [^cell1 wayTo: cell2].	"Calculus for regular cells"
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	cell1 id = (cell1 id min: cell2 id)
		ifTrue:
			[firstCell := cell1.
			lastCell := cell2.
			invert := false]
		ifFalse:
			[firstCell := cell2.
			lastCell := cell1.
			invert := true].
	cellsIntoRectangle := self cellsIntoRectangleFrom: firstCell to: lastCell.
	way := OrderedCollection new.
	self nbNeighbours = 8
		ifTrue:
			[| by |
			firstCell columnNumber < lastCell columnNumber
				ifTrue: [by := 1]
				ifFalse: [by := -1].
			0
				to: (nbLines min: nbCols)
				do:
					[:i | 
					way
						add:
							(cellsIntoRectangle
								detect:
									[:c | 
									c rowNumber = (firstCell rowNumber + i)
										and: [c columnNumber = (firstCell columnNumber + (i * by))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c columnNumber = lastCell columnNumber and: [c rowNumber > way last rowNumber]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c rowNumber = lastCell rowNumber and: [by * c columnNumber > (by * way last columnNumber)]])]].
	self nbNeighbours = 4
		ifTrue:
			[way
				addAll:
					(cellsIntoRectangle select: [:c | c rowNumber = firstCell rowNumber]).
			way
				addAll: (cellsIntoRectangle select: [:c | c columnNumber = lastCell columnNumber])].
	self nbNeighbours = 6
		ifTrue:
			[| by |
			"nbLines odd 
				ifTrue: [
					firstCell numCol > lastCell numCol 
						ifTrue: [firstCell numLine odd ifTrue: [nbCols := nbCols + 1]]
						ifFalse: [lastCell numLine odd ifTrue: [nbCols := nbCols + 1]].
					nbCols := (0 max: (2 * nbCols - nbLines - 1) / 2)]
				ifFalse: [nbCols := (0 max: (2 * nbCols - nbLines) / 2)]."
			"ne fonctionne pas encore... a finir !"
			gridCellShape := #irregular.
			true ifTrue: [^cell1 wayTo: cell2].
			firstCell columnNumber < lastCell columnNumber
				ifTrue: [by := 1]
				ifFalse: [by := -1].
			0
				to: (nbLines min: 2 * nbCols)
				do:
					[:i | 
					way
						add:
							(cellsIntoRectangle
								detect:
									[:c | 
									c rowNumber = (firstCell rowNumber + i)
										and:
											[c columnNumber
												=
													(firstCell columnNumber
														+
															((firstCell rowNumber + i) odd
																ifTrue: [(i - 1) / 2 * by]
																ifFalse: [i / 2 * by]))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c columnNumber = lastCell columnNumber and: [c rowNumber > way last rowNumber]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c rowNumber = lastCell rowNumber and: [by * c columnNumber > (by * way last columnNumber)]])]].
	invert ifTrue: [way := way reverse].
	^way
]
