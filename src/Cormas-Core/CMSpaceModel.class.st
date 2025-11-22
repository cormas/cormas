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
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'cormasModel',
		'gridCellShape',
		'isClosedEnvironment',
		'numberOfRows',
		'numberOfColumns',
		'neighbourhoodConfiguration'
	],
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'defaults' }
CMSpaceModel class >> defaultNumberOfColumns [
	" Answer the <Number> of default columns to create in the receiever's grid "

	^ 10 
]

{ #category : 'defaults' }
CMSpaceModel class >> defaultNumberOfRows [
	" Answer the default <Number> of rows to create in the receiver's grid "
	
	^ 10
]

{ #category : 'accessing' }
CMSpaceModel class >> firstCellIsFlatTopTriangle [

	^CMSpace3Neighbourhood firstCellIsFlatTopTriangle
]

{ #category : 'accessing' }
CMSpaceModel class >> firstCellIsFlatTopTriangle: aBoolean [

	CMSpace3Neighbourhood firstCellIsFlatTopTriangle: aBoolean
]

{ #category : 'accessing' }
CMSpaceModel class >> flatTopHexagons: aBoolean [

	CMSpace6Neighbourhood flatTopHexagons: aBoolean
]

{ #category : 'instance creation' }
CMSpaceModel class >> forModel: aCormasModel [
	" Answer a new space configured for aCormasModel "

	^ self basicNew
		cormasModel: aCormasModel;
		randomNumberGenerator: aCormasModel randomNumberGenerator;
		initialize;
		yourself
]

{ #category : 'accessing' }
CMSpaceModel >> cardinal [
"Returns 3 ,4, 6 or 8"
	^ neighbourhoodConfiguration class cardinal
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellAt: index [

	^ self cells at: index
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellAt: aRowIndex at: aColumnIndex [
	
	^ cormasModel cells at: ((aRowIndex - 1) * numberOfColumns + aColumnIndex)
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellAtId: id [

	^ self cells detect: [ :each | each id = id ]
]

{ #category : 'accessing' }
CMSpaceModel >> cells [

	^ cormasModel cells
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellsBetweenColumn: colNumber1 andColumn: colNumber2 [
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

{ #category : 'accessing cell' }
CMSpaceModel >> cellsBetweenRow: lineNumber1 andRow: lineNumber2 [
	"Return the cells between the lineNumber1 and the lineNumber2 of the spatial grid.
lineNumber1   <Integer> lineNumber = Positive Integer
lineNumber2   <Integer> colNumber = Positive Integer"

	| cells byStep |
	byStep := lineNumber1 > lineNumber2
		ifTrue: [ -1 ]
		ifFalse: [ 1 ].
	cells := OrderedCollection new.
	lineNumber1 to: lineNumber2 by: byStep do: [ :i | cells addAll: (self cellsOfRow: i) ].
	^ cells
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellsBetweenRow: aRowNumber1 andRow: aRowNumber2 column: aColumnNumber1 andColumn: aColumnNumber2 [

	| topRowNumber bottomRowNumber leftColumnNumber rightColumnNumber result |
	
	topRowNumber := aRowNumber1 min: aRowNumber2.
	bottomRowNumber := aRowNumber1 max: aRowNumber2.
	
	leftColumnNumber := aColumnNumber1 min: aColumnNumber2.
	rightColumnNumber := aColumnNumber1 max: aColumnNumber2.
	
	result := self cellsBetweenColumn: leftColumnNumber andColumn: rightColumnNumber.
	
	^ (self cellsBetweenRow: topRowNumber andRow: bottomRowNumber)
		select: [ :cell | result includes: cell ]
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellsInRectangleFrom: cell1 to: cell2 [
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
				do: [:i | cells addAll: (self cellsOfRow: i)]]
		ifFalse:
			[firstCell rowNumber
				to: lastCell rowNumber
				do: [:i | cells addAll: (self cellsOfRow: i) reverse]].
	cells := cells
		select:
			[:c | 
			c columnNumber
				between: (firstCell columnNumber min: lastCell columnNumber)
				and: (firstCell columnNumber max: lastCell columnNumber)].
	invert ifTrue: [cells := cells reverse].
	^cells
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellsOfColumn: colNumber [
	"Return the cells in the colNumber of the spatial grid.
colNumber   <Integer> colNumber = Positive Integer"

	^ cormasModel cells select: [ :cell | cell columnNumber = colNumber ]
]

{ #category : 'accessing cell' }
CMSpaceModel >> cellsOfRow: aRowNumber [

	^ cormasModel cells select: [ :cell | cell rowNumber = aRowNumber ]
]

{ #category : 'accessing cell' }
CMSpaceModel >> centralCell [
	(numberOfRows even or: [ numberOfColumns even ])
		ifTrue: [ ^ self error: 'Grid dimensions is not odd' ].
	^ cormasModel cells at: (numberOfRows * numberOfColumns / 2) asInteger + 1
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

{ #category : 'aggregate' }
CMSpaceModel >> createAggregates: aggregateType from: baseEntityType attribute: attributeName minimumSize: integer [
	"The aggregates occupy the whole grid. 
	baseEntityType = a subClass of  <SpatialEntity> 
	attributeName = #context for example 
	compoundEntity = a subClass of  <SpatialEntitySet>
	This method is not destructive"

	| coll |
	self isClosedEnvironment ifFalse: [ ^ self warningBoundaries ].
	coll := OrderedCollection new.
	(self
		 getGroupsOfConnectedEntiesFrom: baseEntityType
		 attribute: attributeName) do: [ :set |
		set size < integer ifFalse: [
			coll add: (self createOneAggregate: aggregateType from: set) ] ].
	^coll
]

{ #category : 'aggregate' }
CMSpaceModel >> createAggregates: aggregateType from: baseEntityType verifying: aBlock minimumSize: integer [
	"Return N instances of aggregateType of minimumSize. The previous aggregates are not removed.
baseEntityType = a subClass of  <SpatialEntity>
aBlock example = [:aCell | aCell state = #tree]
aggregateType = a subClass of  <SpatialEntityAggregate>
integer = <integer> must be >= 1"

	| coll eeInstances |
	self isClosedEnvironment ifFalse: [ ^ self warningBoundaries ].
	coll := OrderedCollection new.
	eeInstances := (self cormasModel entitiesOfClass: baseEntityType)
		               select: [ :c | aBlock value: c ].
	(CMSpatialEntity connectedCellsAmong: eeInstances) do: [ :set |
		set size < integer ifFalse: [
			coll add: (self createOneAggregate: aggregateType from: set) ] ].
	^ coll
]

{ #category : 'aggregate' }
CMSpaceModel >> createAggregates: aggregateType horizontalDividers: xRatio verticalDividers: yRatio [
	"Creates (xRatio x yRatio) aggregates of cells by dividing the grid by yRatio columns and xRatio lines.
The aggregates will  occupy the whole grid. 
	aggregateType = a subClass of  <SpatialEntitySet>
	This method is not destructive"

	
	self isClosedEnvironment ifFalse: [ ^ self warningBoundaries ].
	^(self
		 getSetsOfContiguousCellsHorizontalDividers: xRatio
		 verticalDividers: yRatio) collect: [ :set |
		(self createOneAggregate: aggregateType from: set) ].

]

{ #category : 'initialization' }
CMSpaceModel >> createCells [

	1 to: self gridSize do: [ :i |
		(cormasModel newEntity: self cormasModel cellClass)
			spaceModel: self ].
]

{ #category : 'aggregate' }
CMSpaceModel >> createOneAggregate: compoundEntityClass from: aCollectionOfSpatialEntities [
	"Creates and returns an instance of Aggregat composed with a set of SpatialEntities. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntityClass = a Class inheriting from <SpatialEntitySet>"

	| anAggregate |
	anAggregate := self newEntity: compoundEntityClass.
	anAggregate addComponents:
		aCollectionOfSpatialEntities asOrderedCollection.
	^ anAggregate
]

{ #category : 'accessing' }
CMSpaceModel >> dimensions [
	" Answer a <Point> with the receiver's lines and columns "
	
	^ self numberOfColumns @ self numberOfRows
]

{ #category : 'landscape indices' }
CMSpaceModel >> distanceFromCell: cellA toCell: cellB [
	"return the distance in number of cells (also known as Manhattan distance)"

	|  pointA pointB |
	
	pointA := (cellA rowNumber @ cellA columnNumber).
	pointB := (cellB rowNumber @ cellB columnNumber).

	^ self isClosedEnvironment
		ifTrue: [ 
			self neighbourhoodConfiguration
				distanceInClosedEnvironmentFromPoint: pointA
				toPoint: pointB ]
		ifFalse: [
			self neighbourhoodConfiguration
				distanceInOpenEnvironmentFromPoint: pointA
				toPoint: pointB
			
			"self neighbourhoodConfiguration
				distanceInOpenEnvironmentFromPoint: pointA
				toPoint: pointB" ]

]

{ #category : 'landscape indices' }
CMSpaceModel >> dominance: attribute [
	"Compute dominance according to the attribute"

	| numberCells sum n pi classes |
	numberCells := self numberOfRows * self numberOfColumns.
	sum := 0.
	classes := (self cormasModel cells collect: [ :a | a perform: attribute ]) asSet.
	n := classes size.
	classes
		do: [ :i | 
			pi := (self cormasModel cells select: [ :a | (a perform: attribute) = i ]) size
				/ numberCells.
			sum := sum + (pi * pi ln) ].
	^ n ln + sum
]

{ #category : 'landscape indices' }
CMSpaceModel >> euclideanDistanceFromCell: cell1 toCell: cell2 [
	"return the euclidian distance (unit = cell) using the Euclidean distance formula : square root of [(Xa - Xb)^2 + (Ya - Yb)^2)]"

	| nbLines nbCols |
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	self isClosedEnvironment
		ifFalse: [ nbLines > (self numberOfRows - 2)
				ifTrue: [ nbLines := nbLines - self numberOfRows + 2 ].
			nbCols > (self numberOfColumns - 2)
				ifTrue: [ nbCols := nbCols - self numberOfColumns + 2 ] ].
	^ (nbLines squared + nbCols squared) sqrt
]

{ #category : 'private - aggregate' }
CMSpaceModel >> getGroupsOfConnectedEntiesFrom: baseEntityType attribute: attributeName [
	"Return a collection of sets of contiguous components holding the same attributeName value"

	| newCollection baseEntities attributeValues eeInstances |
	newCollection := OrderedCollection new.
	baseEntities := self cormasModel entitiesOfClass: baseEntityType.
	attributeValues := (baseEntities collect: [ :c | c perform: attributeName ]) asSet.

	attributeValues do: [ :val |
		eeInstances := baseEntities select: [ :c | (c perform: attributeName) = val ].
		newCollection addAll:
			(CMSpatialEntity connectedCellsAmong: eeInstances) ].
	^ newCollection
]

{ #category : 'private - aggregate' }
CMSpaceModel >> getSetsOfContiguousCellsHorizontalDividers: i verticalDividers: j [

	| nbLP nbCP zone allComponents collec line column |
	"dimensions d'une partition"
	nbLP := numberOfRows / j.
	nbCP := numberOfColumns / i.
	"calcul sous-grille de chaque zone"
	allComponents := Dictionary new.
	1 to: i * j do: [ :n |
	allComponents at: n put: OrderedCollection new ].
	self cormasModel cells do: [ :cc |
		line := (cc id / numberOfColumns) ceiling.
		column := cc id - (line - 1 * numberOfColumns).
		zone := numberOfColumns / nbCP * ((line / nbLP) ceiling - 1)
		        + (column / nbCP) ceiling.
		(allComponents at: zone) add: cc ].
	collec := OrderedCollection new.
	1 to: allComponents size do: [ :n |
	collec add: (allComponents at: n) ].
	^ collec
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

	^ numberOfRows * numberOfColumns

]

{ #category : 'initialization' }
CMSpaceModel >> initialize [
	super initialize.
	"self resetSpatialEntities."
	
	isClosedEnvironment := true
]

{ #category : 'initialization' }
CMSpaceModel >> initializeRegularNumberOfRows: aNumberOfRows numberOfColumns: aNumberOfColumns neighbourhood: aNumber closed: aBoolean [
	" Private - Create a grid of regular cells."

	self cormasModel resetEntities: self cormasModel cellClass.
	self numberOfRows: aNumberOfRows numberOfColumns: aNumberOfColumns.
	isClosedEnvironment := aBoolean.
	self numberOfNeighbours: aNumber.


]

{ #category : 'private - accessing' }
CMSpaceModel >> isClosedEnvironment [
	"Open environment is torroidal. If you go over the edge, you come back from the other side
	Closed environment is not torroidal. The edges have 'walls' and you can't cross them"
	
	^ isClosedEnvironment
]

{ #category : 'private - accessing' }
CMSpaceModel >> isClosedEnvironment: aBoolean [

	isClosedEnvironment := aBoolean.
]

{ #category : 'testing' }
CMSpaceModel >> isIrregular [
	"Answer if the spaceModel is irregular (or regular), meaning that the cells are not uniform, but have different shapes (vectorial)"
	
	^gridCellShape = #irregular
]

{ #category : 'accessing cell' }
CMSpaceModel >> lowerLeftCell [
	^ cormasModel cells at: numberOfColumns * (numberOfRows - 1) + 1
]

{ #category : 'accessing cell' }
CMSpaceModel >> lowerRightCell [
	^ cormasModel cells at: numberOfColumns * numberOfRows
]

{ #category : 'accessing' }
CMSpaceModel >> nearestEmptyCellFor: aCell [

	^ (aCell nearestEmptyNeighborsWithinRadius: (self numberOfRows max: self numberOfColumns))
		ifNotEmpty: [ :cells | self selectRandomlyFrom: cells ]
		ifEmpty: [ nil ]
]

{ #category : 'landscape indices' }
CMSpaceModel >> nearestNeighbourProbaAttribute: anAttribute state1: x1 state2: x2 [
	"return the data (a number) to be recorded"
	
	| c1 c2 |
	c1 := self cormasModel cells select: [:a | (a perform: anAttribute) = x1].
	c2 := c1 select: [:a | a neighbourhood anySatisfy: [:b | (a perform: anAttribute) = x2 ] ].
	^ c2 size / c1 size
]

{ #category : 'accessing' }
CMSpaceModel >> neighbourhoodConfiguration [
	^ neighbourhoodConfiguration
]

{ #category : 'accessing' }
CMSpaceModel >> neighbourhoodConfiguration: aCMSpaceNeighbourhood [ 

	neighbourhoodConfiguration := aCMSpaceNeighbourhood.
	
	self gridCellShape: neighbourhoodConfiguration gridCellShapeType.
	self createCells.
	neighbourhoodConfiguration initializeNeighbourhoodFor: self
]

{ #category : 'private - init' }
CMSpaceModel >> newEntity: aClass [
	" Creates a new instance of aClass and collects it at the level of theXXXs collection"

	^ (aClass new: self)
		  cormasModel: self cormasModel;
		  randomNumberGenerator: randomNumberGenerator;
		  yourself
]

{ #category : 'private - accessing' }
CMSpaceModel >> numberOfColumns [
	" Answer the <Number> of columns in the receiver's grid "
	
	^ numberOfColumns
		ifNil: [ numberOfColumns := self class defaultNumberOfColumns ]
]

{ #category : 'private - accessing' }
CMSpaceModel >> numberOfNeighbours [
	" Answer a <Number> representing the receiver configured number of neighbours of regular cells "

	^ self neighbourhoodConfiguration numberOfNeighbours
]

{ #category : 'initialization' }
CMSpaceModel >> numberOfNeighbours: anIntegerOrSymbol [
	
	| configClass config |
	
	configClass := CMSpaceNeighbourhood concreteSubclasses
		detect: [ :subclass | subclass isStartConditionFor: anIntegerOrSymbol ]
		ifNone: [ self error: 'Should not happen' ].
		
	config := configClass new
		numberOfRows: self numberOfRows;
		numberOfColumns: self numberOfColumns;
		isClosedEnvironment: self isClosedEnvironment;
		yourself.

	self neighbourhoodConfiguration: config
]

{ #category : 'private - accessing' }
CMSpaceModel >> numberOfRows [
	" Answer the <Number> of rows of the receiver's grid "
	
	^ numberOfRows
		ifNil: [ numberOfRows := self class defaultNumberOfRows ]
]

{ #category : 'private - accessing' }
CMSpaceModel >> numberOfRows: aNumberOfRows numberOfColumns: aNumberOfColumns [

	numberOfRows := aNumberOfRows.
	numberOfColumns := aNumberOfColumns.
]

{ #category : 'printing' }
CMSpaceModel >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.

	aStream
		space;
		<< self numberOfRows asString;
		<< $x;
		<< self numberOfColumns asString;
		<< $(;
		<< self gridSize asString;
		<< $);
		space;
		<< self gridCellShape asString
		
]

{ #category : 'accessing cell' }
CMSpaceModel >> randomCell [
	"Return a spatialEntityElement (aCell) picked randomly from the spatial grid."

	^ self selectRandomlyFrom: cormasModel cells
]

{ #category : 'accessing cell' }
CMSpaceModel >> upperLeftCell [
	^ cormasModel cells first
]

{ #category : 'accessing cell' }
CMSpaceModel >> upperRightCell [
	^ cormasModel cells at: numberOfColumns
]

{ #category : 'aggregate' }
CMSpaceModel >> warningBoundaries [

	UIManager default inform: ' The grid boundaries should be closed !'
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
	cellsIntoRectangle := self cellsInRectangleFrom: firstCell to: lastCell.
	way := OrderedCollection new.
	self numberOfNeighbours = 8
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
	self numberOfNeighbours = 4
		ifTrue:
			[way
				addAll:
					(cellsIntoRectangle select: [:c | c rowNumber = firstCell rowNumber]).
			way
				addAll: (cellsIntoRectangle select: [:c | c columnNumber = lastCell columnNumber])].
	self numberOfNeighbours = 6
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
