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
	#name : #CMSpaceModel,
	#superclass : #Model,
	#instVars : [
		'cardinal',
		'activeSpatialEntity',
		'line',
		'column',
		'elementaryEntitiesDefaultPovs',
		'cormasModel',
		'arrayOrigins',
		'nbNeighbours',
		'rMaxEntityImage',
		'spatialEntities',
		'gridCellShape',
		'gridCellImage',
		'xll',
		'yll',
		'cellSize',
		'absoluteBounds',
		'autoResizeBounds',
		'isFull',
		'closed'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'instance creation' }
CMSpaceModel class >> forModel: aCormasModel [

	^ self basicNew 
		cormasModel: aCormasModel;
		initialize;
		yourself.
]

{ #category : #'private - absoluteWorld' }
CMSpaceModel >> absoluteBounds [
	"the absolute default space is a square space of 50x50. It has been defined for a 10x10 cells space.
It is never display, only copied by the SpaceViews.
It can be modified (setAbsoluteBounds) when for exemple there is 3 lines and 10 column. Then, absoluteBounds = 3/10 * 50 @ 50"
	
	^absoluteBounds
		ifNil:
			[absoluteBounds := Rectangle
				origin: 0 @ 0
				extent: 50 @ 50]
]

{ #category : #'private - absoluteWorld' }
CMSpaceModel >> absoluteBounds: aRectangle [
	
	absoluteBounds := aRectangle
]

{ #category : #'private - absoluteWorld' }
CMSpaceModel >> absoluteHeight [
	
	^self absoluteBounds height
]

{ #category : #'private - absoluteWorld' }
CMSpaceModel >> absoluteWidth [
	
	^self absoluteBounds width
]

{ #category : #'private - accessing' }
CMSpaceModel >> activeSpatialEntity [
	
	^activeSpatialEntity
]

{ #category : #'private - accessing' }
CMSpaceModel >> activeSpatialEntity: aClass [
	
	activeSpatialEntity := aClass
]

{ #category : #deprecated }
CMSpaceModel >> aggregate: listPolygons [
	"merge-aggregation of the other polygons on the first of the list"

	| fusion allPolygons theOthers |
	self flag: #shouldBeRevised.
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
			fusion neighbourhood: nil.
			self voisinsPolygonesNoeuds: (Array with: fusion).	"Reconstruction of the neighbourhood of the neighbours of the new polygon"
			fusion neighbourhood do: [ :p | p neighbourhood: nil ].
			self
				voisinsPolygonesNoeuds: fusion neighbourhood asOrderedCollection.	"Updating the components of the new spatial entity, in case it is composed of"
			(fusion class inheritsFrom: CMSpatialEntityElement)
				ifFalse: [ theOthers do: [ :p | fusion addComponents: p components ] ] ]
]

{ #category : #deprecated }
CMSpaceModel >> aggregate: listPolygons new: entityC [
	"Creation of an N+1 level integer by aggregation of N level polygons"

	"!!! The elements of listPolygons must be adjacent. !!!"

	| newEntityC |
	self flag: #shouldBeRevised.
	listPolygons isEmpty
		ifFalse: [ newEntityC := entityC new init.	"Calcul des coordonnees d'origine"
			newEntityC outline: (self outlineAggregatedFrom: listPolygons).	"Updating the coordinates of the polygon image in the drawing window"
			self setImagesPolygons: (Array with: newEntityC).	"Construction of the neighbourhood of the new polygon"
			newEntityC neighbourhood: nil.
			self voisinsPolygonesNoeuds: (Array with: newEntityC).	"Reconstruction of the neighbourhood of the neighbours of the new polygon"
			newEntityC neighbourhood do: [ :p | p neighbourhood: nil ].
			self
				voisinsPolygonesNoeuds: newEntityC neighbourhood asOrderedCollection.	"Updating the components of the new spatial entity"
			newEntityC addComponents: listPolygons.
			(self cormasModel
				perform: (self cormasModel getterForEntityClass: entityC))
				add: newEntityC ]
]

{ #category : #accessing }
CMSpaceModel >> aggregateClasses [
	^ self cormasModelClass compoundSpatialClasses
]

{ #category : #accessing }
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

{ #category : #deprecated }
CMSpaceModel >> aggregatesInstancesOf: entityE condition: methodName [
	| nameEntitiesE theInterestingEntitiesE setOfComponents seed neighbours newNeighbours |
	self flag: #shouldBeRevised.
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

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> ajouterAutresAttribut: cel objet: objet attribut: attrib [
	"Ex: cel = 0.49018@13.7327   objet = a Cell   attrib = 'center'"
	
	| listeAttributs position |
	listeAttributs := objet class allInstVarNames.
	1
		to: listeAttributs size
		do: [:b | (listeAttributs at: b) = attrib ifTrue: [position := b]].
	objet instVarAt: position put: cel
]

{ #category : #accessing }
CMSpaceModel >> allOccupants [
	"return a list of all the located entities"

	^ self cormasModel allTheEntities select: [ :entity | entity isSituated ]
]

{ #category : #accessing }
CMSpaceModel >> allTheEntities: aClass [
	^ self cormasModel allTheEntities: aClass
]

{ #category : #accessing }
CMSpaceModel >> allTheSituatedEntities: aClass [
	
	^self cormasModel allTheSituatedEntities: aClass
]

{ #category : #'private - accessing' }
CMSpaceModel >> arrayOrigins: anArray [
	
	arrayOrigins := anArray
]

{ #category : #accessing }
CMSpaceModel >> autoResizeBounds [
	^ autoResizeBounds ifNil: [ autoResizeBounds := true ]
]

{ #category : #accessing }
CMSpaceModel >> autoResizeBounds: anObject [
	autoResizeBounds := anObject
]

{ #category : #'private - regular polygons' }
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

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> buildAggregates: compoundEntity from: baseEntity verifying: aBlock [
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock, except that the aggregats are not reset.
baseEntity = a subClass of <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>"
	
	^self buildAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> buildAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms [
	"This method is equivalent to setAggregates: compoundEntity from: baseEntity verifying: aBlock minimumSize: ms, except that the previous aggregats are not reset.
baseEntity = a subClass of  <SpatialEntity>
aBlock example = [:cell | cell state = #tree]
compoundEntity =a subClass of  <SpatialEntitySet>
ms= <integer> must be >= 1"

	| coll |
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	coll := OrderedCollection new.
	(self getAggregatesFrom: baseEntity verifying: aBlock)
		do: [ :set | 
			set size < ms
				ifFalse: [ coll add: (self createSilentlyAggregate: compoundEntity from: set) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ coll
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> buildAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity [
	" ! Deprecated ! Should use : "
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> buildAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity minimumSize: ms [
	" ! Deprecated ! Should use : "
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> buildFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement [
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method do not resets all aggregates 'compoundEntity' . 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a subClass of  <SpatialEntityNotConnex>"

	| aSet agg |
	self closed
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

{ #category : #'private - accessing' }
CMSpaceModel >> cardinal [
"Number of cells of the grid"
	^ cardinal
]

{ #category : #'private - accessing' }
CMSpaceModel >> cardinal: anInteger [
	cardinal := anInteger.
	arrayOrigins := Array new: anInteger
]

{ #category : #accessing }
CMSpaceModel >> cellClass [
	"return the SpatialEntityElement class of the current model"

	^ self cormasModelClass cellClass
]

{ #category : #'CSE (general) - import - export' }
CMSpaceModel >> cellFileDirectory [
"Returns a FileReference to the maps subdirectory of the model.
Ex: /Users/.../cormas/assets/models/ECEC/maps"
	^ self resourceLocator mapsPath: self cormasModelClass shortName
]

{ #category : #'private - accessing' }
CMSpaceModel >> cellSize [
	^ cellSize
]

{ #category : #'private - accessing' }
CMSpaceModel >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #'ESE (regular) - special locations' }
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

{ #category : #'ESE (regular) - special locations' }
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

{ #category : #'ESE (regular) - special locations' }
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

{ #category : #'ESE (regular) - special locations' }
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

{ #category : #'ESE (regular) - special locations' }
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
	firstCell numCol < lastCell numCol
		ifTrue:
			[firstCell numLine
				to: lastCell numLine
				do: [:i | cells addAll: (self cellsOfLine: i)]]
		ifFalse:
			[firstCell numLine
				to: lastCell numLine
				do: [:i | cells addAll: (self cellsOfLine: i) reverse]].
	cells := cells
		select:
			[:c | 
			c numCol
				between: (firstCell numCol min: lastCell numCol)
				and: (firstCell numCol max: lastCell numCol)].
	invert ifTrue: [cells := cells reverse].
	^cells
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> cellsOfColumn: colNumber [
	"Return the cells in the colNumber of the spatial grid.
colNumber   <Integer> colNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell numCol = colNumber ]
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> cellsOfLine: lineNumber [
	"Return the cells in the lineNumber of the spatial grid.
lineNumber   <Integer> lineNumber = Positive Integer"

	^ self elementaryEntities select: [ :cell | cell numLine = lineNumber ]
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> centralLocation [
	(line even or: [ column even ])
		ifTrue: [ ^ self cormas warn: 'Grid dimensions is not odd' ].
	^ self elementaryEntities at: (line * column / 2) asInteger + 1
]

{ #category : #'private - notification' }
CMSpaceModel >> changed: anAspectSymbol with: aParameter [
	"All changes are redirected to cormasModel which can buffer them"
	
	self cormasModel registerSpaceModelChange: anAspectSymbol with: aParameter
]

{ #category : #'private - notification' }
CMSpaceModel >> checkRemoteSpaceModels [
	
	| notResponding |
	notResponding := Set new.
	self myDependents
		do: [:c | (self ping: c) ifFalse: [notResponding add: c]].
	notResponding do: [:c | self removeDependent: c]
]

{ #category : #'user interface' }
CMSpaceModel >> closeGraphicWindows [
	"propagate some closeRequest to dependents. Added while removing Cormas>>spaceInterfaces link"
	
	self changed: #closeRequest
]

{ #category : #'private - accessing' }
CMSpaceModel >> closed [
	
	^closed
]

{ #category : #'private - accessing' }
CMSpaceModel >> closed: aBoolean [
	
	closed = aBoolean ifTrue: [^self].
	closed := aBoolean.
	self initNeighbourhood.
	self initEdge.
	self cormasModel registerSpaceModelChange: #boundariesChanged	"dispatch the info to other spaceInterfaces"
]

{ #category : #'private - accessing' }
CMSpaceModel >> column [
	^ column
]

{ #category : #'private - accessing' }
CMSpaceModel >> connexity [
	"Purpose: returns the value of the grid connexity, i.e. 8, 4 or 6.
	If the grid is irregular, returns 0"
	
	self gridCellShape = #irregular
		ifTrue: [ ^ 0 ].
	self nbNeighbours = #eight
		ifTrue: [ ^ 8 ].
	self nbNeighbours = #four
		ifTrue: [ ^ 4 ].
	self nbNeighbours = #six
		ifTrue: [ ^ 6 ]
]

{ #category : #'private - accessing' }
CMSpaceModel >> cormas [
	
	^cormasModel cormas
]

{ #category : #'private - accessing' }
CMSpaceModel >> cormasModel [
	
	^cormasModel
]

{ #category : #'private - accessing' }
CMSpaceModel >> cormasModel: aCormasModel [
	"The cormasModel is some kind of model for the spaceModel (receive notification)"
	
	cormasModel == aCormasModel ifTrue: [^self].
	cormasModel ifNotNil: [cormasModel removeDependent: self].
	cormasModel := aCormasModel.
	cormasModel ifNotNil: [cormasModel addDependent: self]
]

{ #category : #accessing }
CMSpaceModel >> cormasModelClass [
	^ self cormasModel class
]

{ #category : #'private - regular polygons' }
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

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> createCells [
	"create all the cells and their connexions, and collect them as elementaryEntities collection"

	| allEse |
	allEse := Array new: cardinal.
	self cormasModelClass cellClass CurrentId: 0.
	1 to: cardinal do:
		[ :i | allEse at: i put: (self newEntity: self cormasModelClass cellClass) ].	"and collect them"
	self elementaryEntities: allEse.
	self gridCellShape = #squared
		ifTrue: [ self createRectangularCellsFigure ].
	self gridCellShape = #hexagonal
		ifTrue: [ self createHexagonalCellsFigure ].
	self initNeighbourhood.
	self closed
		ifTrue: [ self initEdge ].	"newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
	"self sendCellsToClientSpaceModels: (EntityReference onEntities: allEse)."	"dispatch the info that cells have been modified to all opened spaceInterfaces"
	self changed: #newCells
]

{ #category : #'private - regular cells - instance creation' }
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
	self flag:#TODO.
	"c''est ici qu''il faut corriger le bug de decalage des cellules en bas à droite sous vw7.9"
]

{ #category : #'private - regular polygons' }
CMSpaceModel >> createOneAggregate: compoundEntity from: aSet [
	"Creates and returns an instance of compoundEntity composed with a set of cells. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| aggregate |
	aggregate := self createAggregate: compoundEntity from: aSet.	"alarm the other"
	self dispatchOneCompoundSpatialEntity: aggregate.
	^aggregate
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> createRectangularCellsFigure [
	"creation des coordonnees de l'ensemble des cellules carrees de la grille"
	
	| cote carre aPov i |
	self elementaryEntitiesDefaultPovs: nil.
	self setAbsoluteBounds.
	cote := self absoluteBounds height / self line.	"cote := self absoluteBounds width / self column.  c'est pareil"
	carre := Rectangle
		origin: (cote * -1) @ 0
		corner: 0 @ cote.
	i := 1.
	self line timesRepeat: [ 
		self column timesRepeat: [
			carre := carre translateBy: carre width @ 0.
			aPov := VectorialElementaryPOV new: carre asPolyline.
			aPov name: #nil.
			aPov entityReference: (EntityReference on: (self elementaryEntities at: i)).
			self elementaryEntitiesDefaultPovs add: aPov.
			i := i + 1 ].
		carre := carre translateBy: (self column negated * carre width) @ carre height ].

]

{ #category : #'private - regular polygons' }
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

{ #category : #'private - regular cells - instance creation' }
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

{ #category : #'private - dispatch' }
CMSpaceModel >> dispatchCompoundSpatialEntity: class [
	"Gives the new entities to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel
		setTheEntity: class
		with: (self spatialEntities at: class name).
	self cormasModel registerSpaceModelChange: #newAggregates with: class
]

{ #category : #'private - dispatch' }
CMSpaceModel >> dispatchOneCompoundSpatialEntity: anEntity [
	"Gives the new entity to cormasModel and alarm the spaceInterfaces"
	
	self cormasModel collect: anEntity.
	self cormasModel
		registerEntityChange: #addAggregate
		with: (EntityReference onEntities: anEntity components)
		from: (EntityReference on: anEntity)
]

{ #category : #'private - display' }
CMSpaceModel >> display: aCollec on: aGC [
	
	aGC paint: self vue backgroundColor.
	aGC displayRectangle: aGC clippingBounds.
	(aCollec isNil or: [aCollec isEmpty]) ifFalse: [aCollec do: [:e | e show]]
]

{ #category : #'private - display' }
CMSpaceModel >> displayInfo: aSymbol of: aClass [
	"Purpose: set the INFO of aClass to be displayed on the opened spatial grid
Example : self displayInfo: #landUse of: Cell"
	
	self openedSpatialGrids
		do: [:interface | interface changeInfo: aSymbol ofEntity: aClass]	"self changed: #changeInfo: with: (DisplayPovChange forPov: aSymbol ofEntity: aClass)"
]

{ #category : #'private - display' }
CMSpaceModel >> displayPov: aSymbol of: aClass [
	"Purpose: set the POV of aClass to be displayed on the opened spatial grid
Example : self displayPov: #landUse of: Cell"
	
	self
		changed: #changePov
		with: (CMDisplayPovChange forPov: aSymbol ofEntity: aClass)
]

{ #category : #'landscape indices' }
CMSpaceModel >> distanceFromCell: cell1 toCell: cell2 [
	"return the distance in number of cells (also known as Manhattan distance)"

	| nbLines nbCols |
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self closed
		ifFalse: [ nbLines > (self line - 2)
				ifTrue: [ nbLines := nbLines - self line + 2 ].
			nbCols > (self column - 2)
				ifTrue: [ nbCols := nbCols - self column + 2 ] ].
	self nbNeighbours = #eight
		ifTrue: [ ^ nbLines max: nbCols ].
	self nbNeighbours = #four
		ifTrue: [ ^ nbLines + nbCols ].
	self nbNeighbours = #six
		ifTrue: [ nbLines odd
				ifTrue:
					[ "celui des 2 qui est √† droite, s'il est sur la partie droite de sa colonne  (ligne impaire), je rajoute 1 √† dC"
					cell1 numCol > cell2 numCol
						ifTrue: [ cell1 numLine odd
								ifTrue: [ nbCols := nbCols + 1 ] ]
						ifFalse: [ cell2 numLine odd
								ifTrue: [ nbCols := nbCols + 1 ] ].
					^ nbLines + (0 max: (2 * nbCols - nbLines - 1) / 2) ]
				ifFalse: [ ^ nbLines + (0 max: (2 * nbCols - nbLines) / 2) ] ].	"for irregular cells, the calculus is much more longer"
	^ cell1 distanceCell: cell2	"If nbLines is odd, 
	dist = nbLines if nbCols < (nbLines + 1)/ 2    otherwise
	dist = nbLines + (2.nbCols - nbLines - 1)/ 2
If nbLines is even, 
	dist = nbLines if nbCols < nbLines/ 2           otherwise
	dist = nbLines + (2.nbCols - nbLines)/ 2
explications:  a) dL impaire
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC -3
D1 : dL = 2.dC-3  alors on ajoute 1 
D2 : dL = 2.dC-5  alors on ajoute 2 
D3 : dL = 2.dC-7  alors on ajoute 3 
...
Dt : dL = 2.dC-(1+2t)   t est l'incr√©ment.
alors: t = (2.dC -1 - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL -1) / 2 si c'est positif]
			b) dL paire :
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC - 2
D1 : dL = 2.dC-2  alors on ajoute 1 
D2 : dL = 2.dC-4  alors on ajoute 2 
D3 : dL = 2.dC-6  alors on ajoute 3 
...
Dt : dL = 2.dC-(2t)   t est l'incr√©ment.
alors: t = (2.dC - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL) / 2 si c'est positif] 
bon en fait √ßa ne marche pas :
il faut aussi rajouter 1 √† dC qd dL est impaire..."
]

{ #category : #'landscape indices' }
CMSpaceModel >> distanceFromHexagonalCell: cell1 toCell: cell2 [
	"return the distance in number of hexagonal cells"

	| nbLines nbCols add colTheoriq |
	self nbNeighbours = #six
		ifFalse: [ self halt ].
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self closed
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

{ #category : #'landscape indices' }
CMSpaceModel >> dominance: attribute [
	"Compute dominance according to the attribute"

	| numberCells sum n pi classes |
	numberCells := self line * self column.
	sum := 0.
	classes := (self cormasModel theESE collect: [ :a | a perform: attribute ]) asSet.
	n := classes size.
	classes
		do: [ :i | 
			pi := (self cormasModel theESE select: [ :a | (a perform: attribute) = i ]) size
				/ numberCells.
			sum := sum + (pi * pi ln) ].
	^ n ln + sum
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> eastCell: k [
	k \\ column = 0
		ifFalse: [ ^ k + 1 ].
	^ closed
		ifTrue: [ 0 ]
		ifFalse: [ k - (column - 1) ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> eastCellHexa: k [
	
	k = 0 ifTrue: [^0].
	k < column | ((k - 1) // column + 1) odd
		ifTrue:
			["ligne impaire ou premiere"
			^k]
		ifFalse:
			["ligne paire"
			^self eastCell: k]
]

{ #category : #'landscape indices' }
CMSpaceModel >> edgeDensity: aClass [
	"return the data (a number) to be recorded"

	| size |
	size := 0.
	(self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass) asSymbol)
		do: [ :a | size := size + a surround size ].
	^ size / self cormasModel theESE size
]

{ #category : #'landscape indices' }
CMSpaceModel >> edgeDensity: aClass totalArea: aNumber [
	"this method is created for cases where the totalArea is not equal to the total size of the grid"

	| size |
	size := 0.
	(self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass))
		do: [ :a | size := size + a perimeter ].
	^ size / aNumber
]

{ #category : #'private - regularCells - shapes' }
CMSpaceModel >> eightconnexe [
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue:
			[self gridCellShape: #squared.
			self createRectangularCellsFigure].
	self nbNeighbours ~= #eight
		ifTrue:
			[self nbNeighbours: #eight.
			self initNeighbourhood].
	self changed: #shapeHasChanged with: 8	"dispatch the info to all spaceInterfaces"
]

{ #category : #accessing }
CMSpaceModel >> elementaryEntities [
	
	^self spatialEntities at: self cellClass name
]

{ #category : #'private - accessing' }
CMSpaceModel >> elementaryEntities: x [
	
	self spatialEntities
		at: self cormasModelClass cellClass name
		put: x	"(self dependents notNil and: [line * column > x size])
		ifTrue: [self vue mainInterface updateWindowName]"
]

{ #category : #accessing }
CMSpaceModel >> elementaryEntitiesDefaultPovs [
	
	^elementaryEntitiesDefaultPovs
		ifNil: [elementaryEntitiesDefaultPovs := OrderedCollection new]
]

{ #category : #accessing }
CMSpaceModel >> elementaryEntitiesDefaultPovs: anObject [
	
	elementaryEntitiesDefaultPovs := anObject
]

{ #category : #'user interface' }
CMSpaceModel >> envSpecStringFor: spatialEntityName [
	"compute the description of the environnment (for the spaceInterface title)"

	| s nb |
	s := (String new: 100) writeStream.
	s
		nextPutAll:
			(self closed
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

{ #category : #'landscape indices' }
CMSpaceModel >> euclideanDistanceFromCell: cell1 toCell: cell2 [
	"return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"

	| nbLines nbCols |
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self closed
		ifFalse: [ nbLines > (self line - 2)
				ifTrue: [ nbLines := nbLines - self line + 2 ].
			nbCols > (self column - 2)
				ifTrue: [ nbCols := nbCols - self column + 2 ] ].
	^ (nbLines squared + nbCols squared) sqrt
]

{ #category : #'import - export' }
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

{ #category : #'import - export' }
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

{ #category : #'private - import - export' }
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
					[firstValue cormasHelper isTypeNumber
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
		byIncreasing: #numLine
		thenByIncreasing: #numCol.
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

{ #category : #'private - display' }
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

{ #category : #'private - regularCells - shapes' }
CMSpaceModel >> fourconnexe [
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #squared
		ifTrue:
			[self gridCellShape: #squared.
			self createRectangularCellsFigure].
	self nbNeighbours ~= #four
		ifTrue:
			[self nbNeighbours: #four.
			self initNeighbourhood].
	self changed: #shapeHasChanged with: 4	"dispatch the info to other spaceInterfaces"
]

{ #category : #'landscape indices' }
CMSpaceModel >> fractalDimension: aClass [
	| aCollection aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	aCollection := aggregates
		collect: [ :a | Array with: a size ln with: (a perimeter / 4) ln ].
	^ ((Cormas linearRegression: aCollection) at: 2) * 2
]

{ #category : #'private - regular polygons' }
CMSpaceModel >> getAggregatesFrom: baseEntity attribute: attributeName [
	"Return a collection of sets of contiguous components holding the same attributeName value"

	| newCollection seed setOfComponents neighbours newNeighbours theLLEntities |
	self closed
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

{ #category : #'private - regular polygons' }
CMSpaceModel >> getAggregatesFrom: baseEntity verifying: aBlock [
	| eeInstances set seed neighbours newNeighbours collec |
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	eeInstances := ((self cormasModel
		perform: (self cormasModel getterForEntityClass: baseEntity))
		select: [ :c | aBlock value: c ]) copy asOrderedCollection.
	collec := OrderedCollection new.	"collec est une collection de set (composants des agregats)"
	[ eeInstances isEmpty ]
		whileFalse: [ set := OrderedCollection new.
			seed := eeInstances first.
			set add: seed.
			neighbours := seed neighbourhood select: [ :v | aBlock value: v ].
			[ neighbours isEmpty ]
				whileFalse: [ set addAll: neighbours.
					newNeighbours := OrderedCollection new.
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

{ #category : #'import - export' }
CMSpaceModel >> getDataFromASCFile: aFileName onAttribute: att [
	
	| file buffer separator fileData temp line2 cols rows i |
	separator := Character cr.
	file := ((Cormas mapsPath: self cormasModelClass name) construct:
			aFileName) readStream.	"On devine le format des lignes"
	file lineEndAuto.
	fileData := OrderedCollection new.
	buffer := [[file atEnd]
		whileFalse:
			[temp := file upTo: separator.
			line2 := temp copyReplaceAll: '-9999' with: 'nil'.
			fileData add: line2]].
	buffer valueNowOrOnUnwindDo: [file close].	"Remove the header of files"
	cols := ((fileData at: 1) asArrayOfSubstrings at: 2) asNumber.
	rows := ((fileData at: 2) asArrayOfSubstrings at: 2) asNumber.
	xll := ((fileData at: 3) asArrayOfSubstrings at: 2) asNumber.
	yll := ((fileData at: 4) asArrayOfSubstrings at: 2) asNumber.
	cellSize := ((fileData at: 5) asArrayOfSubstrings at: 2) asNumber.
	fileData removeFirst: 6.
	(cols ~= self columns or: [rows ~= self line])
		ifTrue:
			[self cormas
				warn: ' Rows and columns are not consistent in ' , aFileName asString].
	i := 1.
	1
		to: rows
		do:
			[:r | 
			1
				to: cols
				do:
					[:c | 
					(self cormasModel theESE at: i)
						perform: (att , ':') asSymbol
						with: ((fileData at: r) asArrayOfSubstrings at: c) asNumber.
					i := i + 1]]
]

{ #category : #'private - accessing' }
CMSpaceModel >> getInstanceOfClass: aClass fromId: anId [
	
	(self spatialEntities isNil
		or:
			[self spatialEntities isEmpty
				or:
					[(self spatialEntities includesKey: aClass name) not
						or: [(self spatialEntities at: aClass name) isEmpty]]])
		ifTrue: [^nil]
		ifFalse:
			[^(self spatialEntities at: aClass name)
				detect: [:i | i id = anId]
				ifNone: [nil]]
]

{ #category : #'accessing povs' }
CMSpaceModel >> getPovsDataOfArcEntity: aClass forSelector: povSelector andInfo: infoName [
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := self cormasModel allTheSituatedEntities: aClass.
	^entities
		collect:
			[:e | 
			Array
				with: (EntityReference on: e)
				with: (e getPovSpecForSelector: povSelector andInfo: infoName)
				with: (EntityReference on: e startNode patch)
				with: (EntityReference on: e stopNode patch)]
]

{ #category : #'accessing povs' }
CMSpaceModel >> getPovsDataOfEntity: aClass forSelector: povSelector andInfo: infoName [
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := (aClass inheritsFrom: CMSpatialEntity)
		ifTrue: [self spatialEntitiesAt: aClass name]
		ifFalse: [self cormasModel allTheSituatedEntities: aClass].
	aClass isSpatialEntitySetClass
		ifTrue:
			[^entities
				collect:
					[:e | 
					(EntityReference on: e)
						->
							(e getPovSpecWithComponentsForSelector: povSelector andInfo: infoName)]]
		ifFalse:
			[^entities
				collect:
					[:e | 
					(EntityReference on: e)
						-> (e getPovSpecForSelector: povSelector andInfo: infoName)]]
]

{ #category : #'accessing povs' }
CMSpaceModel >> getPovsDataOfOccupantEntity: aClass forSelector: povSelector andInfo: infoName [
	"direct access to the pov spec of a set of entities"
	
	| entities |
	entities := (aClass inheritsFrom: CMSpatialEntity)
		ifTrue: [self spatialEntitiesAt: aClass name]
		ifFalse: [self cormasModel allTheSituatedEntities: aClass].
	^entities
		collect:
			[:e | 
			Array
				with: (EntityReference on: e)
				with: (e getPovSpecForSelector: povSelector andInfo: infoName)
				with: (EntityReference on: e patch)]
]

{ #category : #'private - regular polygons' }
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

{ #category : #'private - regular polygons' }
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

{ #category : #'private - regular polygons' }
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

{ #category : #'private - regular polygons' }
CMSpaceModel >> getSetsOfContiguous: baseEntity conditionalBlocks: blocks conditionalArguments: arguments [
	"Return a collection of sets of contiguous components"

	| collec seed setOfContiguousComponents neighbours newNeighbours baseEntities valuesB2 valuesB3 |
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	baseEntities := ((self spatialEntities at: baseEntity name)
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

{ #category : #'private - regular polygons' }
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
	(self spatialEntities at: baseEntity name)
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

{ #category : #'private - regular polygons' }
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

{ #category : #'private - accessing' }
CMSpaceModel >> gridCellShape [
	
	^gridCellShape
]

{ #category : #'private - accessing' }
CMSpaceModel >> gridCellShape: x [
	
	gridCellShape := x
]

{ #category : #testing }
CMSpaceModel >> hasGraphicInterfaces [
	"check if some interfaces are opened. This hack was added while removing spaceInterfaces from cormas"
	
	^self dependents contains: [:each | each isKindOf: SpaceInterface]
]

{ #category : #'private - regularCells - shapes' }
CMSpaceModel >> hexagonal [
	"received from SpaceInterface menu, when the user want to change the shape of the cells"
	
	self gridCellShape ~= #hexagonal
		ifTrue:
			[self gridCellShape: #hexagonal.
			self nbNeighbours: #six.
			self createHexagonalCellsFigure.	"the spaceInterfaces are automatically refreshed"
			self initNeighbourhood.
			self changed: #shapeHasChanged]	"set the menu and title to the spaceInterfaces"
]

{ #category : #'import - export' }
CMSpaceModel >> importAggregateClass: class componentClass: cClass separator: aChar filename: aStringOrFileName [
	| stream portableFilename ligne dataVector item id nbComponents collec aggregate |
	aStringOrFileName isString
		ifTrue: [ portableFilename := (Cormas mapsPath: self cormasModelClass name)
				construct: aStringOrFileName ]
		ifFalse: [ portableFilename := aStringOrFileName ].
	portableFilename asFilename exists
		ifFalse: [ ^ self cormas warn: portableFilename asString , ' is missing !!!' ].
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	(self spatialEntities isNil
		or: [ self spatialEntities isEmpty
				or: [ (self spatialEntities includesKey: cClass name) not
						or: [ (self spatialEntities at: cClass name) isEmpty ] ] ])
		ifTrue: [ self cormas warn: 'pb !!!'.
			self halt ].
	self resetCompoundSpatialEntity: class andTheirComponents: cClass.
	stream := portableFilename asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	[ stream atEnd ]
		whileFalse: [ ligne := (stream upTo: Character cr) readStream.
			dataVector := OrderedCollection new.
			[ ligne atEnd ]
				whileFalse: [ item := ligne upTo: aChar.
					dataVector add: item asNumber ].
			ligne close.
			id := dataVector first.
			dataVector remove: id.
			nbComponents := dataVector first.
			dataVector remove: nbComponents.
			dataVector size = nbComponents
				ifFalse: [ self cormas warn: 'pb !!!'.
					self halt ]
				ifTrue: [ collec := (self spatialEntities at: cClass name)
						select: [ :i | dataVector includes: i id ].
					collec size = nbComponents
						ifFalse: [ self cormas warn: 'pb !!!'.
							self halt ]
						ifTrue: [ aggregate := class new: self.
							aggregate addSilentlyComponents: collec.
							(self spatialEntities at: class name) add: aggregate ] ] ].
	stream close.
	self cormasModel
		perform: (self cormasModel setterForEntityClass: class)
		with: (self spatialEntities at: class name).
	self dispatchCompoundSpatialEntity: class
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> initAggregates: compoundEntity fromSeeds: aCollec [
	"Create N aggregates from a collection of N cells. 
	The new aggregates are only composed of one cell (the seed); their 'givenSize' attribut value is determine by the distribution.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> "

	self closed
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollec first class.
	aCollec
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifFalse: [ self createSilentlyAggregate: compoundEntity from: (Set with: s) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
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
	self closed
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
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> initEdge [
	
	| n |
	self gridCellShape = #irregular ifTrue: [^self setIrregularEntitiesEdge].
	nbNeighbours == #four
		ifTrue: [n := 4]
		ifFalse:
			[nbNeighbours == #six
				ifTrue: [n := 6]
				ifFalse:
					[nbNeighbours == #eight
						ifTrue: [n := 8]
						ifFalse: [self halt]]].
	self elementaryEntities
		do:
			[:p | 
			p neighbourhood size = n
				ifTrue: [p edge: false]
				ifFalse: [p edge: true]]
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> initEntitesSpatiales: aClass [
	"Creation de la collection d'entites spatiales du modele"
	"Ca me parait inutile !!"
	
	"self cormasModel theEntities: aClass .  Returns a orderedCollection of all the instances of aClass collected by cormasModel"
	"	aggregatesCollection := self cormasModel getterForEntityClass: aClass.
	self cormasModel class instVarNames detect: [:i | i = aggregatesCollection]
		ifNone: [self halt].
	self cormasModel perform: (aggregatesCollection , ':') asSymbol
		with: (self spatialEntities at: aClass name)"
	
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> initNeighbourhood [
	
	gridCellShape == #squared
		ifTrue:
			[(nbNeighbours == #four or: [nbNeighbours = 4])
				ifTrue: [self initNeighbourhood4]
				ifFalse: [self initNeighbourhood8]]
		ifFalse:
			[(nbNeighbours == #six or: [nbNeighbours = 6])
				ifTrue: [self initNeighbourhood6]
				ifFalse: [self voisinsPolygonesNoeuds: self elementaryEntities]].
	self elementaryEntities do: [:p | p initNeighbourhood]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> initNeighbourhood4 [
	| v i |
	1 to: cardinal do: [ :k | 
		(self elementaryEntities at: k) isNil
			ifFalse: [ v := Array new: 4.
				(i := self northCell: k) > 0
					ifTrue: [ v at: 1 put: (self elementaryEntities at: i) ].
				(i := self westCell: k) > 0
					ifTrue: [ v at: 2 put: (self elementaryEntities at: i) ].
				(i := self southCell: k) > 0
					ifTrue: [ v at: 3 put: (self elementaryEntities at: i) ].
				(i := self eastCell: k) > 0
					ifTrue: [ v at: 4 put: (self elementaryEntities at: i) ].
				(self elementaryEntities at: k) orderedNeighbourhood: v ] ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> initNeighbourhood6 [
	| v i |
	1 to: cardinal do: [ :k | 
		(self elementaryEntities at: k) isNil
			ifFalse: [ v := Array new: 6.
				(i := self westCellHexa: (self northCell: k)) > 0
					ifTrue: [ v at: 1 put: (self elementaryEntities at: i) ].
				(i := self westCell: k) > 0
					ifTrue: [ v at: 2 put: (self elementaryEntities at: i) ].
				(i := self westCellHexa: (self southCell: k)) > 0
					ifTrue: [ v at: 3 put: (self elementaryEntities at: i) ].
				(i := self eastCellHexa: (self southCell: k)) > 0
					ifTrue: [ v at: 4 put: (self elementaryEntities at: i) ].
				(i := self eastCell: k) > 0
					ifTrue: [ v at: 5 put: (self elementaryEntities at: i) ].
				(i := self eastCellHexa: (self northCell: k)) > 0
					ifTrue: [ v at: 6 put: (self elementaryEntities at: i) ].
				(self elementaryEntities at: k) orderedNeighbourhood: v ] ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> initNeighbourhood8 [
	| v i |
	1 to: cardinal do: [ :k | 
		(self elementaryEntities at: k) isNil
			ifFalse: [ v := Array new: 8.
				(i := self northCell: k) > 0
					ifTrue: [ v at: 1 put: (self elementaryEntities at: i) ].
				(i := self northCell: (self westCell: k)) > 0
					ifTrue: [ v at: 2 put: (self elementaryEntities at: i) ].
				(i := self westCell: k) > 0
					ifTrue: [ v at: 3 put: (self elementaryEntities at: i) ].
				(i := self southCell: (self westCell: k)) > 0
					ifTrue: [ v at: 4 put: (self elementaryEntities at: i) ].
				(i := self southCell: k) > 0
					ifTrue: [ v at: 5 put: (self elementaryEntities at: i) ].
				(i := self southCell: (self eastCell: k)) > 0
					ifTrue: [ v at: 6 put: (self elementaryEntities at: i) ].
				(i := self eastCell: k) > 0
					ifTrue: [ v at: 7 put: (self elementaryEntities at: i) ].
				(i := self northCell: (self eastCell: k)) > 0
					ifTrue: [ v at: 8 put: (self elementaryEntities at: i) ].
				(self elementaryEntities at: k) orderedNeighbourhood: v ] ]
]

{ #category : #'private - init' }
CMSpaceModel >> initialize [
	super initialize.
	self resetSpatialEntities
]

{ #category : #'private - init' }
CMSpaceModel >> initializeIrregular [
	
	gridCellShape := #irregular.
	nbNeighbours := #irregular.
	closed := true.
	line := nil.
	column := nil.
	cardinal := 0	"arrayOrigins := Array new: cardinal."
]

{ #category : #'private - init' }
CMSpaceModel >> initializeRegular [
"create a grid of 10x10 cells by default"
	self
		line: 10
		column: 10
		shape: #squared
		nbNeighbours: #four
		closed: true.
	self createCells 
]

{ #category : #'ESE initialize-release' }
CMSpaceModel >> initializeRegularLines: lines columns: columns shape: shapeSymbol nbNeighbours: nbSymbol closed: aBoolean [
	"Create a grid of regular cells.
lines = number of lines. columns = number of columns.
shapeSymbol =<Symbol> (#squared , )
nbSymbol =<Symbol> (#four, #six or #eight)
aBoolean = <Boolean> (true for closed, false for toroidal).
ex, from CormasModel:
	self spaceModel initializeRegularColumns: 101 lines: 101 shape: #squared nbNeighbours: #eight toroidal: true."

	self resetSpatialEntities.
	self
		line: lines
		column: columns
		shape: shapeSymbol
		nbNeighbours: nbSymbol
		closed: aBoolean.
	self createCells
]

{ #category : #deprecated }
CMSpaceModel >> initializeRegularX: columns Y: lines shape: shapeSymbol nbNeighbours: nbSymbol boundaries: bSymbol [
	"This method is deprecated. Please use initializeRegularColumns:lines:shape:nbNeighbours:closed: instead."

	"Create a grid of regular cells.
lines = number of lines. columns = number of columns.
shapeSymbol =<Symbol> (#squared , )
nbSymbol =<Symbol> (#four, #six or #eight)
bSymbol = <Symbol> (#toroidal or #closed) .
ex, from CormasModel:
	self spaceModel initializeRegularX: 101 Y: 101 shape: #squared nbNeighbours: #eight boundaries: #toroidal."

	self
		deprecated:
			'This method is no longer supported. Please use initializeRegularColumns:lines:shape:nbNeighbours:closed: instead.'.
	^ self
		initializeRegularLines: lines
		columns: columns
		shape: shapeSymbol
		nbNeighbours: nbSymbol
		closed: bSymbol ~= #torroidal
]

{ #category : #'private - init' }
CMSpaceModel >> initializeView [
	
	| aView |
	"self release."
	aView := SpaceView new.
	aView model: self.
	aView controller: SpaceController new.
	aView controller performer: self.
	aView contextualMenu
]

{ #category : #testing }
CMSpaceModel >> isFull [
	"Answer if the spaceModel is completely occupied by cells, meaning that some cells are missing or not "
	
	^ isFull 
		ifNil: [ self cardinal = self elementaryEntities size ]
]

{ #category : #testing }
CMSpaceModel >> isFull: anObject [

	isFull := anObject
]

{ #category : #testing }
CMSpaceModel >> isIrregular [
	"Answer if the spaceModel is irregular (or regular), meaning that the cells are not uniform, but have different shapes (vectorial)"
	
	^gridCellShape = #irregular
]

{ #category : #'private - regular polygons' }
CMSpaceModel >> isPartitionComplete: compoundEntity [
	
	^(self elementaryEntities
		contains: [:c | (c isComponentOf: compoundEntity) not]) not
]

{ #category : #'private - accessing' }
CMSpaceModel >> line [
	
	^line
]

{ #category : #'private - accessing' }
CMSpaceModel >> line: i column: j [
	
	line := i.
	column := j.
	cardinal := i * j
]

{ #category : #'private - init' }
CMSpaceModel >> line: l column: c shape: ps nbNeighbours: nbn closed: b [
	self gridCellShape: ps.
	self nbNeighbours: nbn.
	closed := b.
	self line: l column: c
]

{ #category : #video }
CMSpaceModel >> listMethodsChanged [
	"some methods has changed. Propagate the changed to the  spaceInterfaces."
	
	self changed: #listMethodsChanged
]

{ #category : #'CSE (general) - import - export' }
CMSpaceModel >> loadEnvironmentFromDirectory: aStringOrFileReference [
"Purpose: Create a grid from a cells directory.
 Example of string: 'poor.cells' 
 See ISSUE #311 from Tomooda: https://github.com/cormas/cormas/issues/311:
The old .env file is split into multiple files in a directory with a YAML file for parameters of the space model and CSV files corresponding to its attributes.
For example, assuming that we have the following Sample.env file:
		dimensions      27 27
		cloture closed
		connexite       eight
		delimiteur      0
		attributs       biomass(Number)
		2
		3
		1
		...
Now there is a 'Sample.cells' directory with the following 'spaceModel.yml
		version: 0.0.1
		dimensions: [27, 27]
		closed: false
		connectivity: eight
		attributes:
 			biomass: Number
+ a biomass.csv file of 27 lines and 27 columns:
	2,3,1,...
	9,2,6,...
 "
	| cellsFile |
	cellsFile := aStringOrFileReference isString
		ifTrue: [ self cellFileDirectory / aStringOrFileReference ]
		ifFalse: [ aStringOrFileReference ].
	cellsFile exists
		ifFalse: [ | envFile |
			envFile := cellsFile withExtension: 'env'.
			envFile exists
				ifTrue: [ CMEnv2CellsConverter fromFile: envFile ]
				ifFalse: [ ^ self error: 'No such a file.' ] ].
	CMCellsLoader new
		spaceModel: self;
		load: cellsFile
]

{ #category : #'ESE initialize-release' }
CMSpaceModel >> loadEnvironmentFromDirectory: aName withPov: aSymbol [
	"Load a grid stored as filename and display a POV on each opened grid.
	aName = <String> or aName = <FileReference> . If aName = <String>, it creates a directory in the maps directory.
	Example:	aName = 'test.cells' "
	
	self loadEnvironmentFromDirectory: aName.
	self
		displayPov: aSymbol
		of: self cellClass
]

{ #category : #'CSE (general) - import - export' }
CMSpaceModel >> loadNeighboorsClass: class separator: aChar [
	| stream portableFilename ligne dataVector item id anEntity |
	portableFilename := (Cormas mapsPath: self cormasModelClass name)
		construct: class name asString , '_Neighboors.agg'.
	portableFilename asFilename exists
		ifFalse: [ ^ self cormas warn: portableFilename asString , ' is missing !!!' ].
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	(self spatialEntities isNil
		or: [ self spatialEntities isEmpty
				or: [ (self spatialEntities includesKey: class name) not
						or: [ (self spatialEntities at: class name) isEmpty ] ] ])
		ifTrue: [ self cormas warn: 'pb !!!'.
			self halt ].	"self resetSpatialEntity: class."
	stream := portableFilename asFilename readStream.	"On devine le format des lignes"
	stream lineEndAuto.
	[ stream atEnd ]
		whileFalse: [ ligne := (stream upTo: Character cr) readStream.
			dataVector := OrderedCollection new.
			[ ligne atEnd ]
				whileFalse: [ item := ligne upTo: aChar.
					dataVector add: item asNumber ].
			ligne close.
			id := dataVector first.
			anEntity := self getInstanceOfClass: class fromId: id.
			anEntity neighbourhood: OrderedCollection new.
			dataVector remove: id.
			dataVector
				do: [ :anID | 
					anEntity neighbourhood
						add: (self getInstanceOfClass: class fromId: anID) ] ].
	stream close
]

{ #category : #'playback-log' }
CMSpaceModel >> logLeaveOf: anAgentLocation from: aSpatialEntity [
	"Log the fact that an agent left a spatial entity"
	"Ask the instance of Cormas"
	
	cormasModel cormas logLeaveOf: anAgentLocation from: aSpatialEntity
]

{ #category : #'playback-log' }
CMSpaceModel >> logMovementOf: anAgentLocation from: srcSpatialEntity to: dstSpatialEntity [
	"Log the movement of an agent from a spatial entity to another entity"
	"Ask the instance of Cormas"
	
	cormasModel cormas logMovementOf: anAgentLocation from: srcSpatialEntity
		to: dstSpatialEntity
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> lowerLeftLocation [
	^ self elementaryEntities at: column * (line - 1) + 1
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> lowerRightLocation [
	^ self elementaryEntities at: column * line
]

{ #category : #'landscape indices' }
CMSpaceModel >> meanCompactness: aClass [
	| sum aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	sum := aggregates
		inject: 0
		into: [ :cumul :aggreg | cumul + aggreg updateCompactness ].
	^ aggregates size = 0
		ifTrue: [ 0 ]
		ifFalse: [ sum / aggregates size ]
]

{ #category : #'landscape indices' }
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

{ #category : #'landscape indices' }
CMSpaceModel >> meanPatchSize: aClass [
	"return the data (a number) to be recorded"

	| size aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	size := 0.
	aggregates do: [ :a | size := size + a components size ].
	^ size / aggregates size
]

{ #category : #'landscape indices' }
CMSpaceModel >> nPatches: aClass [
	"return the data (a number) to be recorded"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size
]

{ #category : #'landscape indices' }
CMSpaceModel >> nbDistinctValuesOf: anAttribute [
	"Return the number of different values for anAttribute"

	^ (self cormasModel theESE collect: [ :a | a perform: anAttribute ]) asSet size
]

{ #category : #'private - accessing' }
CMSpaceModel >> nbNeighbours [
	
	^nbNeighbours
]

{ #category : #'private - accessing' }
CMSpaceModel >> nbNeighbours: aSymbolOrInteger [

	nbNeighbours := aSymbolOrInteger 
]

{ #category : #'landscape indices' }
CMSpaceModel >> nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2 [
	"return the data (a number) to be recorded"
	
	| c1 c2 |
	c1 := self cormasModel theESE select: [:a | (a perform: anAttribute) = x1].
	c2 := c1
		select:
			[:a | a neighbourhood anySatisfy: [:b | (a perform: anAttribute) = x2]].
	^c2 size / c1 size
]

{ #category : #'private - init' }
CMSpaceModel >> newEntity: aClass [
	"Creates a new instance of aClass and collects it at the level of theXXXs collection. 
	Set also the collector of the new instance"

	^ (aClass new: self)
		cormasModel: self cormasModel;
		"anEntity collector: self cormasModel collector.
	self cormasModel collect: anEntity."
			yourself
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> northCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k > column
		ifTrue: [ ^ k - column ].
	^ closed
		ifTrue: [ 0 ]
		ifFalse: [ column * (line - 1) + k ]
]

{ #category : #'private - display' }
CMSpaceModel >> openedSpatialGrid [
	"Purpose: Return the last opened spatial grid"
	
	| spatialGrids |
	spatialGrids := self openedSpatialGrids.
	^spatialGrids isEmpty
		ifTrue: [nil]
		ifFalse: [spatialGrids last]
]

{ #category : #'private - display' }
CMSpaceModel >> openedSpatialGrids [
	"Purpose: return a collection of all opened spatial grids.
	hack because of opentalk and distributed : looking for SpatialGrid in the dependents is wrong because :
	- some spatialGrids are remote
      - in this case, the registered object is a ClientSpaceModel and not a SpaceInterface
	- Opentalk register a LocalDependent in order to optimize communication
      the actual hack is simple : send a normal update to dependents with #openedSpatialGrid, asking them to register iteself in the result collection.
	Since simple collection have a #value passMode, force a #reference passMode for this result.
	
	"
	
	^self openedSpatialGridsForHabitus: nil
]

{ #category : #'private - irregular polygons aggregation' }
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

{ #category : #'landscape indices' }
CMSpaceModel >> patchDensity: aClass [
	"return the data (a number) to be recorded"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size / (self column * self line)
]

{ #category : #'landscape indices' }
CMSpaceModel >> patchDensity: aClass totalArea: aNumber [
	"this method is created for cases where the totalArea is not equal to the total size of the grid"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size / aNumber
]

{ #category : #'private - notification' }
CMSpaceModel >> ping: anObject [
	
	^[anObject ping]
		on: Exception
		do: [:ex | false]
]

{ #category : #printing }
CMSpaceModel >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		<< self line asString;
		<< $x;
		<< self column asString;
		<< $(;
		<< self cardinal asString;
		<< $);
		space;
		<< self gridCellShape asString

		
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> randomCell [
	"Purpose: Return a spatialEntityElement (aCell) picked randomly from the spatial grid."

	^ Cormas selectRandomlyFrom: self elementaryEntities
]

{ #category : #'private - display' }
CMSpaceModel >> redisplay: aCollec on: aGC [
	"aGC paint: self vue backgroundColor.
	aGC displayRectangle: aGC clippingBounds."
	
	(aCollec isNil or: [aCollec isEmpty]) ifFalse: [aCollec do: [:e | e show]]
]

{ #category : #'ESE initialize-release' }
CMSpaceModel >> release [
	
	self dependents
		do:
			[:spv | 
			spv closeAndUnschedule.
			spv release].
	super release	"	self spatialEntities notNil ifTrue: [self spatialEntities do: [:aCollec | aCollec do: [:e | e release]]]"	"-> Mis en commantaire car les entit√©s n''ont plus de dependents'"
]

{ #category : #'private - init' }
CMSpaceModel >> release: aClass [
	
	super release.
	(self spatialEntities at: aClass name) do: [:e | e spaceModel: nil]
]

{ #category : #'private - init' }
CMSpaceModel >> resetCompoundSpatialEntity: compoundClass andTheirComponents: componentClass [
	
	(self spatialEntities at: componentClass name)
		do:
			[:c | 
			(c theCSE includesKey: compoundClass name)
				ifTrue:
					[c theCSE
						at: compoundClass name
						put: nil]].
	self spatialEntities
		at: compoundClass name
		put: OrderedCollection new.
	self cormasModel initializeTheEntity: compoundClass	"self changed: #createRegularAggregatesImagesFor: with: compoundClass"
]

{ #category : #'private - init' }
CMSpaceModel >> resetSpatialEntities [
	
	| newColl |
	self spatialEntities: Dictionary new. 
	self cormasModel ifNil: [ ^nil ].
	self cormasModelClass spatialClasses
		do:
			[:aSpatialClass | 
			newColl := self cormasModel initializeTheEntity: aSpatialClass.
			self spatialEntities
				at: aSpatialClass name
				put: newColl].
	"self changed: #removeAllFigures"	"all the figures of the spaceInterfaces have to be deleted"
]

{ #category : #'private - init' }
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
				ifTrue: [ self spatialEntities at: se name 	put: theCells ]
				ifFalse: [ self spatialEntities at: se name put: OrderedCollection new.
					"RemotableOrderedCollection new. ** changed to OrderedCollection new. (RemotableOrderedCollection is used for marshalling in remote distributed visualization)" 
					self cormasModel initializeTheEntity: se ] ]
]

{ #category : #accessing }
CMSpaceModel >> resourceLocator [
	" Answer the receiver's <CMResourceLocator>, an object to locate resources on the disk"

	^ self cormasModel resourceLocator
]

{ #category : #'private - import - export' }
CMSpaceModel >> saveAttributesMIFMID: attributes fileParameters: aList class: aClass [
	
	| stream firstValue type firstPatch dicoAttConv c maxX maxY minX minY |
	maxX := 0.
	maxY := 0.
	minX := 1000000000000.
	minY := 1000000000000.
	(self openedSpatialGrid drawing components
		select: [:f | f entityType = aClass])
		do:
			[:a | 
			a points
				do:
					[:aPoint | 
					aPoint x > maxX ifTrue: [maxX := aPoint x asFloat].
					aPoint y > maxY ifTrue: [maxY := aPoint y asFloat].
					aPoint x < minX ifTrue: [minX := aPoint x asFloat].
					aPoint y < minY ifTrue: [minY := aPoint y asFloat]]].	"(self spatialEntities at: aClass name)
		do: [:a | a image component vertices"
	stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
		, aClass name printString , 'Cormas.mif') asFilename writeStream.
	stream
		nextPutAll: 'Version 300';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Charset "WindowsLatin1"';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Delimiter ","';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'CoordSys ';
		nextPutAll: (aList at: 1);
		nextPutAll: ' Units ';
		nextPutAll: (aList at: 2);
		nextPutAll: ' Bounds (';
		nextPutAll: minX printString;
		nextPutAll: ', ';
		nextPutAll: minY printString;
		nextPutAll: ') (';
		nextPutAll: maxX printString;
		nextPutAll: ', ';
		nextPutAll: maxY printString;
		nextPutAll: ')';
		nextPutAll: '\' withCRs.
	stream
		nextPutAll: 'Columns ';
		nextPutAll: attributes selections size printString;
		nextPutAll: '\' withCRs.
	dicoAttConv := Dictionary new.
	attributes selections
		do:
			[:att | 
			firstPatch := (self spatialEntities at: aClass name)
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := 'Text'.
					dicoAttConv
						at: att asSymbol
						put: #asString]
				ifFalse:
					[(firstValue isKindOf: Integer)
						ifTrue:
							[type := 'Integer'.
							dicoAttConv
								at: att asSymbol
								put: #printString]
						ifFalse:
							[(firstValue isKindOf: Float)
								ifTrue:
									[type := 'Float'.
									dicoAttConv
										at: att asSymbol
										put: #printString]
								ifFalse:
									[firstValue isString
										ifTrue:
											[type := 'char (20)'.
											dicoAttConv
												at: att asSymbol
												put: #asString]
										ifFalse:
											[(firstValue isKindOf: Boolean)
												ifTrue:
													[type := 'char (20)'.
													dicoAttConv
														at: att asSymbol
														put: #printString]
												ifFalse:
													[type := '(nil)'.
													dicoAttConv
														at: att asSymbol
														put: #printString]]]]].
			stream
				nextPutAll: att;
				nextPutAll: ' ';
				nextPutAll: type;
				nextPutAll: '\' withCRs].
	stream
		nextPutAll: 'Data ';
		nextPutAll: '\' withCRs.
	(self openedSpatialGrid drawing components
		select: [:f | f entityType = aClass])
		do:
			[:a | 
			"(self spatialEntities at: aClass name)
		do: 
			[:a | "
			stream
				nextPutAll: 'Region 1 ';
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: a points size printString;
				nextPutAll: '\' withCRs.
			a points
				do:
					[:aPoint | 
					stream
						nextPutAll: aPoint x asFloat printString;
						nextPutAll: ' ';
						nextPutAll: (minY + maxY - aPoint y asFloat) printString;
						nextPutAll: '\' withCRs]].
	stream close.
	stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
		, aClass name printString , 'Cormas.mid') asFilename writeStream.
	(self spatialEntities at: aClass name)
		do:
			[:a | 
			attributes selections
				do:
					[:b | 
					c := dicoAttConv
						at: b asSymbol
						ifAbsent: [nil].
					c isNil
						ifTrue: [stream nextPutAll: '0']
						ifFalse: [stream nextPutAll: ((a perform: b asSymbol) perform: c)].
					attributes selections last = b ifFalse: [stream nextPutAll: ',']].
			stream nextPutAll: '\' withCRs].
	stream close
]

{ #category : #'import - export' }
CMSpaceModel >> saveAttributesRSTRDC: attributes fileParameters: aList [
	
	| stream firstPatch firstValue typeAtt a typeData |
	attributes selections
		do:
			[:att | 
			stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\' ,
					att , 'Cormas.rst') asFilename writeStream.
			firstPatch := self elementaryEntities
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstPatch isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstPatch perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[self cormas
						warn:
							'The type can only be byte, integer of real.' , att , ' is not exportable'.
					stream close.
					^nil]
				ifFalse:
					[(firstValue isKindOf: Number)
						ifTrue:
							[typeAtt := #printString.
							firstValue isInteger
								ifTrue: [typeData := 'integer']
								ifFalse: [typeData := 'real']]
						ifFalse:
							[self cormas
								warn:
									'The type can only be byte, integer of real.' , att , ' is not exportable'.
							stream close.
							^nil]].
			self elementaryEntities
				do:
					[:patch | 
					a := att asSymbol.
					stream nextPutAll: ((patch perform: a) perform: typeAtt).
					stream nextPutAll: '\' withCRs].
			stream close.
			stream := ((Cormas mapsPath: self cormasModelClass name) asString , '\'
				, att , 'Cormas.rdc') asFilename writeStream.
			stream
				nextPutAll: 'file format ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 1);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'file title  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 2);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'data type   ';
				nextPutAll: ': ';
				nextPutAll: typeData;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'file type   ';
				nextPutAll: ': ';
				nextPutAll: 'ascii';
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'columns     ';
				nextPutAll: ': ';
				nextPutAll: column printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'rows        ';
				nextPutAll: ': ';
				nextPutAll: line printString;
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'ref. system ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 3);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'ref. units  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 4);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'unit dist.  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 5);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. X      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 6);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. X      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 7);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. Y      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 8);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. Y      ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 9);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'pos''n error ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 10);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'resolution  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 11);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'min. value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 12);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'max. value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 13);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'display min ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 14);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'display max ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 15);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'value units ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 16);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'value error ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 17);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'flag value  ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 18);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'flag def''n ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 19);
				nextPutAll: '\' withCRs.
			stream
				nextPutAll: 'legend cats ';
				nextPutAll: ': ';
				nextPutAll: (aList at: 20);
				nextPutAll: '\' withCRs.
			stream close]
]

{ #category : #'CSE (general) - import - export' }
CMSpaceModel >> saveNeighboorsClass: class separator: aChar [
	"Creates in maps directory a file named 'class_Neighboors.agg' which contains lines representing each intance of class 'class'. 
Each line contains the id of the instance as first element and the id of all its neighboors separated by aChar"
	
	| stream filename |
	filename := (Cormas mapsPath: self cormasModelClass name)
		construct: class name asString , '_Neighboors.agg'.
	stream := filename asFilename writeStream.
	(self spatialEntities notNil
		and:
			[self spatialEntities isEmpty not
				and:
					[(self spatialEntities includesKey: class name)
						and: [(self spatialEntities at: class name) isEmpty not]]])
		ifTrue:
			[(self spatialEntities at: class name)
				do:
					[:a | stream nextPutAll: ((a neighborsStringWithSeparator: aChar) , '\') withCRs]].
	stream close
]

{ #category : #'private - absoluteWorld' }
CMSpaceModel >> setAbsoluteBounds [
	"the absolute default space is a square space of 50x50 pixels. It has been defined for a 10x10 cells space.
It is never display, only copied by the SpaceViews.
It can be modified (setAbsoluteBounds) when for exemple there is 3 lines and 10 column. Then, absoluteBounds = 3/10 * 50 @ 50 pixels"
	
	| absoluteWidth absoluteHeight |
	absoluteBounds := nil.
	absoluteWidth := self absoluteBounds width * self column.
	absoluteHeight := self absoluteBounds height * self line.
	self
		absoluteBounds:
			(Rectangle
				origin: 0 @ 0
				extent: absoluteWidth @ absoluteHeight)
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName [
	"The aggregates occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self closed
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	(self getAggregatesFrom: baseEntity attribute: attributeName)
		do: [ :set | self createSilentlyAggregate: compoundEntity from: set ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName1 attribute: attributeName2 [
	"The aggregates occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self closed
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
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity attribute: attributeName excludingValue: aValue [
	"The aggregates do not occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	aValue is a specific value of the attribute, for instance #notDefined, or 0
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self closed
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
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity horizontalDividers: xRatio verticalDividers: yRatio [
	"Creates (xRatio x yRatio) aggregates by dividing the grid by yRatio columns and xRatio lines.
The aggregates will  occupy the whole grid. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	baseEntity = a subClass of  <SpatialEntity> 
	compoundEntity = a subClass of  <SpatialEntitySet>"

	self closed
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
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity from: baseEntity verifying: aBlock [
	"baseEntity = a subClass of  <SpatialEntityElement>
aBlock example = [:cell | cell state = #tree]
compoundEntity = a subClass of  <SpatialEntitySet>
This method resets all aggregats 'compoundEntity' and rebuids them"
	
	^self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: 1
]

{ #category : #'CSE (regular) - instance creation' }
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

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity fromSeeds: aCollec [
	"Purpose: Create n aggregates that will occupy the whole grid. The number n of aggregates correspond to the size of aCollecOfCells. Each aggregate is made of an element of aCollecOfCells (a seed) and of its surrounding cells. This method resets all aggregates 'compoundEntity' and rebuilds them.
Arguments: aCollecOfCells is a collection of cells (SpatialEntityElement). compoundEntity is a Class name inheriting from SpatialEntitySet.
Example: self createAggregates: VitalArea fromSeeds: (self theDens collect:[:c | c patch])
Example: self createAggregates: Forest fromSeeds: (self theCells select:[:c| c isForestSeed]."
	
	| haveSpread |
	self initAggregates: compoundEntity fromSeeds: aCollec.
	haveSpread := true.
	[haveSpread] whileTrue: [haveSpread := self swell: compoundEntity].
	^self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity fromSeeds: aCollecOfCells sizeDistribution: aDistribution [
	"Create aggregates from a collection of cells according to a size distribution. 
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfCells = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a subClass of  <SpatialEntitySet> 
	this method is supposed to receive a size distribution 
	aDistribution = Collection ( (n1,s1), (n2,s2)) , n being the number of aggregates of size s. 
	Example: to generate 3 aggregates size 1, 5 aggregates size 2, and 2 aggregates size 3, this has to be (#(3 1) #(5 2) #(2 3)). 
		self spaceModel setAggregates: Forest fromSeeds: self theCells sizeDistribution: #(#(3 1) #(5 2) #(2 3)) 
	This method uses the attribute called givenSize defined for SpatialEntityAggregate"
	
	| haveSpread coll |
	coll := self initAggregates: compoundEntity fromSeeds: aCollecOfCells
		sizeDistribution: aDistribution.
	haveSpread := true.
	[haveSpread] whileTrue: [haveSpread := self swell: compoundEntity].
	^coll
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity fromSeeds: aCollec verifying: aBlock [
	
	| haveSpread |
	self initAggregates: compoundEntity fromSeeds: aCollec.
	haveSpread := true.
	[haveSpread]
		whileTrue: [haveSpread := self swell: compoundEntity verifying: aBlock].
	^self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setAggregates: compoundEntity fromSeeds: aCollec verifying: aBlock sizeDistribution: dis [
	
	| haveSpread |
	self initAggregates: compoundEntity fromSeeds: aCollec sizeDistribution:
			dis.
	haveSpread := true.
	[haveSpread]
		whileTrue: [haveSpread := self swell: compoundEntity verifying: aBlock].
	^self spatialEntities at: compoundEntity name
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> setAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> setAggregatesFrom: baseEntity verifying: aBlock into: compoundEntity minimumSize: ms [
	
	self setAggregates: compoundEntity from: baseEntity verifying: aBlock
		minimumSize: ms
]

{ #category : #'private - irregular polygons aggregation' }
CMSpaceModel >> setAggregatsBounds: agregat [
	
	| origin corner aComponent |
	(self spatialEntities at: agregat name)
		do:
			[:ag | 
			aComponent := ag components asOrderedCollection first.
			origin := aComponent bounds origin.
			corner := aComponent bounds corner.
			ag components
				do:
					[:b | 
					origin := b bounds origin min: origin.
					corner := b bounds corner max: corner].
			ag bounds: (Rectangle origin: origin corner: corner)]
]

{ #category : #'private - irregular polygons creation' }
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

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntities: compoundEntity from: baseEntity attribute: attributeName [
	"baseEntity = a Class name inheriting from <SpatialEntity>	
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| fragmentedEntity beInstances collec |
	self closed
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
			(self spatialEntities at: compoundEntity name)
				add: fragmentedEntity ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntities: compoundEntity from: baseEntity verifying: aBlock [
	"baseEntity = a Class name inheriting from <SpatialEntity>
		(can be <SpatialEntityCell> or <SpatialEntityAggregate> or <SpatialEntityNotConnex>) 
	aBlock (example = [:cell | cell isTree] or [:aggregat | aggregat type = #forest] ) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| fragmentedEntity beInstances |
	self closed
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: baseEntity.
	beInstances := ((self cormasModel
		perform: (self cormasModel getterForEntityClass: baseEntity) asSymbol)
		select: [ :c | aBlock value: c ]) copy asOrderedCollection.
	fragmentedEntity := compoundEntity new: self.
	fragmentedEntity addSilentlyComponents: beInstances.
	(self spatialEntities at: compoundEntity name) add: fragmentedEntity.
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setFragmentedEntity: compoundEntity fromCollection: aCollecOfSpatialEntityElement [
	"create one aggregate <SpatialEntityNotConnex> made of a collection of spatialEntityElements.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollecOfSpatialEntityElement = a collection of base entities (inheriting from <SpatialEntityElement>) 
	compoundEntity = a Class name inheriting from <SpatialEntityNotConnex>"

	| aSet |
	self closed
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
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'private - regular polygons' }
CMSpaceModel >> setGivenSizes: dis toAggregates: compoundEntity [
	"dis is an array of pair-values: #(#(X1 GS1) #(X2 GS2) ... #(Xi GSi))"
	"Xi and GSi are integers, respectively a number of aggregates and the givenSize for these aggregates"
	"Ex: you want to generate 3 aggregates size 1, 5 size 2, and 2 size 3. dis should be #(#(3 1) #(5 2) #(2 3))"
	"The sum of all Xi should be the same than aCollec size"
	
	| aCollec counter subsetIndice |
	aCollec := self spatialEntities at: compoundEntity name.
	((dis collect: [:pair | pair first])
		inject: 0
		into: [:sum :i | sum + i]) ~= aCollec size
		ifTrue: [self error: 'Inconsistency in the number of aggregates !!!'].
	counter := 0.
	subsetIndice := 1.
	aCollec
		do:
			[:s | 
			s givenSize: (dis at: subsetIndice) last.
			counter := counter + 1.
			counter = (dis at: subsetIndice) first
				ifTrue:
					[counter := 0.
					subsetIndice := subsetIndice + 1]]
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setGridAsAggregat: compoundEntity [
	"Creates one instance of compoundEntity from all the cells <SpatialEntityElement> of the grid.
	This method resets all aggregats 'compoundEntity' and rebuids them.
	compoundEntity : a Class name inheriting from <SpatialEntitySet>"
	
	^self
		setAggregates: compoundEntity
		from: self cormasModelClass cellClass
		verifying: [:c | true]
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> setIrregularEntitiesEdge [
	
	| outlineTempo |
	self elementaryEntities isEmpty ifTrue: [^self halt].
	self elementaryEntities
		do:
			[:aCell | 
			aCell neighbourhood isNil ifTrue: [^self halt].	"on test d'abord si il y a des voisins en bordure: si yenapas ben b n'est pas en bordure"
			(aCell neighbourhood contains: [:neigh | neigh edge ~= false])
				ifFalse: [aCell edge: false]
				ifTrue:
					[outlineTempo := aCell outline copy.
					aCell neighbourhood
						do:
							[:c | outlineTempo removeAllSuchThat: [:point | c outline includes: point]].
					aCell edge: outlineTempo isEmpty not]]
]

{ #category : #'ESE initialize-release' }
CMSpaceModel >> setNbNeighbours: anInteger [
	"Set the neighbourhood of the regular spaceModel.
	anInteger = <Integer : 4, 6 or 8>"

	self nbNeighbours: anInteger.
	(gridCellShape == #squared and: [ anInteger = 6 ])
		ifTrue: [ ^ self hexagonal ].
	(gridCellShape == #hexagonal and: [ anInteger ~= 6 ])
		ifTrue: [ self gridCellShape: #squared.
			self createRectangularCellsFigure ].
	self initNeighbourhood.
	self changed: #shapeHasChanged with: anInteger
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> setPartitionsFrom: baseEntity attribute: attributeName into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity attribute:
			attributeName
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> setPartitionsFrom: baseEntity xRatio: i yRatio: j into: compoundEntity [
	
	self setAggregates: compoundEntity from: baseEntity horizontalDividers: i
		verticalDividers: j
]

{ #category : #'private - regular polygons - deprecated' }
CMSpaceModel >> setPartitionsFromSeeds: seeds into: compoundEntity [
	
	^self setAggregates: compoundEntity fromSeeds: seeds
]

{ #category : #'CSE (regular) - instance creation' }
CMSpaceModel >> setSingletonAggregates: compoundEntity fromSeeds: aCollec [
	"create n (aCollec size) aggregates made of a single component which is an element of aCollec.
	This method resets all aggregates 'compoundEntity' and rebuids them. 
	aCollec = a collection of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"

	self closed
		ifFalse: [ ^ self warningBoundaries ].
	self
		resetCompoundSpatialEntity: compoundEntity
		andTheirComponents: aCollec first class.
	aCollec
		do: [ :s | 
			(s isComponentOf: compoundEntity)
				ifFalse: [ self createSilentlyAggregate: compoundEntity from: (Set with: s) ] ].
	self dispatchCompoundSpatialEntity: compoundEntity.
	^ self spatialEntities at: compoundEntity name
]

{ #category : #'ESE initialize-release' }
CMSpaceModel >> setSpatialEntitiesAttributsValueFromStream: aStream [
	"lecture des valeurs des attributs, et maj des entites spatiales a 
	partir de ces valeurs"
	"balayage de gauche a droite et de bas en haut"
	"Lecture de la 5e ligne: noms des attributs et leur type pour 
	conversion"
	
	| numLigne dataLine i valeur attype label couple name type aCell |
	attype := OrderedCollection new.
	aStream skipSeparators.
	dataLine := (aStream upTo: Character cr) readStream.	
	label := dataLine upTo: Character tab.
	label ~= 'attributs'
		ifTrue: [ ^ self error: 'Error while reading input stream. We expected "attributs" line'].
	[dataLine atEnd]
		whileFalse:
			[couple := OrderedCollection new.
			name := dataLine upTo: $(.
			name := (name , ':') asSymbol.
			type := dataLine upTo: $).
			type := ('as' , type) asSymbol.
			dataLine skipSeparators.
			couple
				add: name;
				add: type.
			attype add: couple].
	dataLine close.
	numLigne := 0.
	[aStream atEnd]
		whileFalse:
			[dataLine skipSeparators.
			 dataLine := (aStream upTo: Character cr) readStream.
			numLigne := numLigne + 1.
			i := 0.
			[dataLine atEnd]
				whileFalse:
					[i := i + 1.
					dataLine skipSeparators.
					valeur := dataLine upTo: $,.
					aCell := self elementaryEntities at: numLigne.
					(attype at: i) last = #asEntity
						ifTrue:
							[valeur := (valeur tokensBasedOn: $.) last asSymbol.
							aCell
								perform: (attype at: i) first
								with: valeur]
						ifFalse:
							[aCell
								perform: (attype at: i) first
								with:
									(valeur = 'nil'
										ifFalse: [valeur perform: (attype at: i) last]
										ifTrue: [nil])]].
			dataLine close].
	aStream close
]

{ #category : #parsing }
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

{ #category : #'utilities - binary storage' }
CMSpaceModel >> settingsFrom: aClone [
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
				shape: aClone gridCellShape
				nbNeighbours: aClone nbNeighbours
				closed: aClone closed ]
]

{ #category : #'landscape indices' }
CMSpaceModel >> shannon: attribute [
	"Answer the Shannon index of the attribute of SpatialEntity suchThat:
    Ha = - SumOf [ occuranceOf(attribut) . ln(occuranceOf(attribut)) ] 
    attribute = <Symbol>"
	
	| cells totCells sum pi setOfValues |
	cells := self cormasModel theESE asArray.	"pour optimisation"
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

{ #category : #video }
CMSpaceModel >> snapGridTimeForMovie: t makingMovie: aBoolean [
	"ask spaceInterfaces for making video"
	
	self
		changed: #snapGridTimeForMovie
		with: (Array with: t with: aBoolean)
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> southCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k <= (column * (line - 1))
		ifTrue: [ ^ k + column ].
	^ closed
		ifTrue: [ 0 ]
		ifFalse: [ k - (column * (line - 1)) ]
]

{ #category : #accessing }
CMSpaceModel >> spaceModel [
	^ self
]

{ #category : #accessing }
CMSpaceModel >> spatialClasses [
	"return a collection of spatial classes"

	^ self cormasModelClass spatialClasses
]

{ #category : #'private - accessing' }
CMSpaceModel >> spatialEntities [

	^ spatialEntities ifNil: [ spatialEntities := Dictionary new ]
]

{ #category : #'private - accessing' }
CMSpaceModel >> spatialEntities: anObject [
	spatialEntities := anObject
]

{ #category : #accessing }
CMSpaceModel >> spatialEntitiesAt: aSpatialEntityName [
	^ self spatialEntities at: aSpatialEntityName
]

{ #category : #accessing }
CMSpaceModel >> spatialEntitiesAt: aSpatialEntityName withPovResultFor: povSelector [
	"return spatialEntities associated with their povResult for a povSelector.
	this is an optimised method sp√©cially for remote access"
	
	^(self spatialEntities at: aSpatialEntityName) asOrderedCollection
		collect: [:each | each -> (each getPovResultFor: povSelector)]
]

{ #category : #'CSE (regular) - dynamics' }
CMSpaceModel >> swell: compoundEntityClass [
	"Each instance of compoundEntityClass swells on its surround layer. It swells if there is enough space arround it. The order of the compoundEntities is randomly mixed. 
	Returns a boolean indicating if at least one aggregate has spread.
	compoundEntityClass = aClass, subclass of SpatialEntitySet"
	
	| haveSpread |
	haveSpread := false.
	(Cormas mix: (self spatialEntities at: compoundEntityClass name))
		do: [:aggregate | aggregate swell ifTrue: [haveSpread := true]].
	^haveSpread
]

{ #category : #'CSE (regular) - dynamics' }
CMSpaceModel >> swell: compoundEntityClass verifying: aConditionBlock [
	"Each instance of compoundEntityClass swells on its surround layer. According to aConditionBlock on the surrounded cells, it swells if its size equals to its given size and if there is enough space arround it. 
	Returns a boolean indicating if at least one aggregate has spread.
	compoundEntityClass = aClass, subclass of SpatialEntitySet"
	
	| newCells haveSpread |
	haveSpread := false.
	(self spatialEntities at: compoundEntityClass name)
		do:
			[:aggregate | 
			newCells := aggregate surround
				select:
					[:c | (c isComponentOf: compoundEntityClass) not and: [aConditionBlock value: c]].
			newCells isEmpty
				ifFalse:
					[(Cormas mix: newCells)
						do:
							[:nc | 
							aggregate size < aggregate givenSize
								ifTrue:
									[haveSpread := true.
									aggregate addSilentlyComponent: nc]].
					aggregate setSurround]].
	(self spatialEntities at: compoundEntityClass name) do: [:c | c show].
	^haveSpread
]

{ #category : #accessing }
CMSpaceModel >> timeStep [
	^ self cormasModel timeStep
]

{ #category : #'user interface' }
CMSpaceModel >> timeUnitName [
	
	^self cormasModel timeUnitName
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> traiterAccesParticulier: val [
	
	| point listePoint |
	listePoint := self traiterChaineDeCaractere: val.
	point := (listePoint at: 1) asNumber @ (listePoint at: 2) asNumber.
	^point
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> traiterAutreChaineDeCaractere: chaine [
	"ex: chaine = '    Pen (1,2,0) '   et retourne une coll du genre : OrderedCollection ('Pen' '(1,2,0) ')  "
	
	| objet liste |
	objet := chaine copyReplaceFrom: 1 to: 4 with: ''.
	liste := self traiterChaineDeCaractere: objet.
	^liste
]

{ #category : #'private - irregular polygons creation' }
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

{ #category : #updating }
CMSpaceModel >> update: aSymbol with: aValue [
	"propagate time changes to the dependents"
	
	aSymbol == #timeChanged ifTrue: [self changed: aSymbol with: aValue].
	super update: aSymbol with: aValue
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> updateIncludedEntities: lesPolygones [
	
	| polygonsWithIE newIncluded poly |
	polygonsWithIE := lesPolygones
		select: [:p | p includedEntities isEmpty not].
	polygonsWithIE
		do:
			[:b | 
			newIncluded := OrderedCollection new.
			b outline
				do:
					[:aPoint | 
					b bounds origin: (b bounds origin min: aPoint).
					b bounds corner: (b bounds corner max: aPoint)].
			b includedEntities
				do:
					[:c | 
					"A priori, s'il est inclus, le polygone c existe en tant que tel dans la liste globale des polygones"
					"Pas si simple !!! MapInfo agrege automatiquement les polygones inclus contigus !!!"
					"On teste sur  le premier point, theoriquement point de suture..."
					poly := lesPolygones select: [:cc | c includes: cc outline first].	"Sinon, c'est que le polygone b est non connexe, et c en est un composant !!!"
					poly isEmpty
						ifTrue: [self halt]
						ifFalse: [newIncluded addAll: poly]].
			b includedEntities: newIncluded.
			b neighbourhood isNil
				ifTrue: [b neighbourhood: b includedEntities copy]
				ifFalse: [b neighbourhood addAll: b includedEntities].	"on ajoute b comme voisin de chaque 'b includedEntities' . Ajout PB"
			newIncluded
				do:
					[:anEntity | 
					anEntity neighbourhood isNil
						ifTrue: [anEntity neighbourhood: (Set with: b)]
						ifFalse: [anEntity neighbourhood add: b]]]
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> upperLeftLocation [
	^ self elementaryEntities at: 1
]

{ #category : #'ESE (regular) - special locations' }
CMSpaceModel >> upperRightLocation [
	^ self elementaryEntities at: column
]

{ #category : #'private - irregular polygons creation' }
CMSpaceModel >> voisinsPolygonesNoeuds: lesPolygones [
	| boundingRectangle p pPrec pCour allPolygones |
	lesPolygones isEmpty
		ifTrue: [ ^ self ].
	allPolygones := self cormasModel
		perform: (self cormasModel getterForEntityClass: lesPolygones first).
	lesPolygones
		do: [ :b | 
			b neighbourhood isNil
				ifTrue: [ b neighbourhood: Set new ].
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
						ifTrue: [ (c bounds regionIntersects: boundingRectangle)
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

{ #category : #deprecated }
CMSpaceModel >> vue [
	"en principe le modele n'a pas a manipuler directement sa vue !!!"
	
	^self dependents isEmpty
		ifTrue: [nil]
		ifFalse: [self dependents first]
]

{ #category : #deprecated }
CMSpaceModel >> vues [
	"DEPRECATED. Should use :"
	
	^self dependents
]

{ #category : #'landscape indices' }
CMSpaceModel >> wayFromCell: cell1 toCell: cell2 [
	"return a collection of cells from cell1 to cell2 (including cell1 and cell2)"
	
	| nbLines nbCols firstCell lastCell invert cellsIntoRectangle way |
	"for irregular cells, the calculus is much more longer"
	self gridCellShape = #irregular ifTrue: [^cell1 wayTo: cell2].	"Calculus for regular cells"
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
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
	self nbNeighbours = #eight
		ifTrue:
			[| by |
			firstCell numCol < lastCell numCol
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
									c numLine = (firstCell numLine + i)
										and: [c numCol = (firstCell numCol + (i * by))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numCol = lastCell numCol and: [c numLine > way last numLine]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numLine = lastCell numLine and: [by * c numCol > (by * way last numCol)]])]].
	self nbNeighbours = #four
		ifTrue:
			[way
				addAll:
					(cellsIntoRectangle select: [:c | c numLine = firstCell numLine]).
			way
				addAll: (cellsIntoRectangle select: [:c | c numCol = lastCell numCol])].
	self nbNeighbours = #six
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
			firstCell numCol < lastCell numCol
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
									c numLine = (firstCell numLine + i)
										and:
											[c numCol
												=
													(firstCell numCol
														+
															((firstCell numLine + i) odd
																ifTrue: [(i - 1) / 2 * by]
																ifFalse: [i / 2 * by]))]])].
			nbLines > (nbLines min: nbCols)
				ifTrue:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numCol = lastCell numCol and: [c numLine > way last numLine]])]
				ifFalse:
					[way
						addAll:
							(cellsIntoRectangle
								select:
									[:c | c numLine = lastCell numLine and: [by * c numCol > (by * way last numCol)]])]].
	invert ifTrue: [way := way reverse].
	^way
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> westCell: k [
	k \\ column = 1
		ifFalse: [ ^ k - 1 ].
	^ closed
		ifTrue: [ 0 ]
		ifFalse: [ k + column - 1 ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceModel >> westCellHexa: k [
	
	k = 0 ifTrue: [^0].
	k < column | ((k - 1) // column + 1) odd
		ifTrue:
			["ligne impaire ou premiere"
			^self westCell: k]
		ifFalse:
			["ligne paire"
			^k]
]

{ #category : #'private - accessing' }
CMSpaceModel >> xll [
	
	^xll
]

{ #category : #'private - accessing' }
CMSpaceModel >> yll [
	
	^yll
]
