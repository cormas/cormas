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

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellAt: aRowIndex at: aColumnIndex [
	
	^ cormasModel cells at: ((aRowIndex - 1) * numberOfColumns + aColumnIndex)
]

{ #category : 'accessing' }
CMSpaceModel >> cells [

	^ cormasModel cells
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

	^ cormasModel cells select: [ :cell | cell columnNumber = colNumber ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellsOfLine: lineNumber [
	" Answer a <Collection> of <> cells in the lineNumber of the spatial grid.
	lineNumber   <Integer> lineNumber = Positive Integer"

	^ cormasModel cells select: [ :cell | cell rowNumber = lineNumber ]
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> centralLocation [
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

{ #category : 'as yet unclassified' }
CMSpaceModel >> createCells [

	1 to: self gridSize do: [ :i |
		(cormasModel newEntity: self cormasModel cellClass)
			spaceModel: self ].
]

{ #category : 'defaults' }
CMSpaceModel >> defaultGridSize [
	" Answer a <Number> representing how many cells we create in the grid by default "
	
	^ 100
]

{ #category : 'accessing' }
CMSpaceModel >> dimensions [
	" Answer a <Point> with the receiver's lines and columns "
	
	^ self numberOfColumns @ self numberOfRows
]

{ #category : 'landscape indices' }
CMSpaceModel >> distanceFromCell: cell1 toCell: cell2 [
	"return the distance in number of cells (also known as Manhattan distance)"

	| nbLines nbCols |
	nbLines := (cell1 rowNumber - cell2 rowNumber) abs.
	nbCols := (cell1 columnNumber - cell2 columnNumber) abs.
	self isClosedEnvironment
		ifFalse: [ nbLines > (self numberOfRows - 2)
				ifTrue: [ nbLines := nbLines - self numberOfRows + 2 ].
			nbCols > (self numberOfColumns - 2)
				ifTrue: [ nbCols := nbCols - self numberOfColumns + 2 ] ].
	^ self neighbourhoodConfiguration distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols.

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
CMSpaceModel >> edgeDensity: aClass [
	"return the data (a number) to be recorded"

	| size |
	size := 0.
	(self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass) asSymbol)
		do: [ :a | size := size + a surround size ].
	^ size / self cormasModel cells size
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

{ #category : 'ESE initialize-release' }
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

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerLeftLocation [
	^ cormasModel cells at: numberOfColumns * (numberOfRows - 1) + 1
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerRightLocation [
	^ cormasModel cells at: numberOfColumns * numberOfRows
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
CMSpaceModel >> nearestEmptyCellFor: aCMAgentLocation [

	^ self neighbourhoodConfiguration nearestEmptyCellFor: aCMAgentLocation.
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

	neighbourhoodConfiguration := aCMSpaceNeighbourhood
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

{ #category : 'accessing' }
CMSpaceModel >> numberOfNeighbours: anIntegerOrSymbol [
	" Set the receiver's neighbourhood configuration to contain anIntegerOrSymbol neighbours "
	
	self neighbourhoodConfiguration: (CMSpaceNeighbourhood forNeighbours: anIntegerOrSymbol spaceModel: self)

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

{ #category : 'landscape indices' }
CMSpaceModel >> patchDensity: aClass [
	"return the data (a number) to be recorded"

	| aggregates |
	aggregates := self cormasModel
		perform: (self cormasModel getterForEntityClass: aClass).
	^ aggregates size / (self numberOfColumns * self numberOfRows)
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

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> randomCell [
	"Return a spatialEntityElement (aCell) picked randomly from the spatial grid."

	^ self selectRandomlyFrom: cormasModel cells
]

{ #category : 'accessing' }
CMSpaceModel >> setBoundaryDirectionsFor: aCMSpatialEntity [
	" Answer a <Collection> of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"

	^ self neighbourhoodConfiguration setBoundaryDirectionsFor: aCMSpatialEntity
]

{ #category : 'accessing' }
CMSpaceModel >> spaceModel [
	^ self
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperLeftLocation [
	^ cormasModel cells first
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperRightLocation [
	^ cormasModel cells at: numberOfColumns
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
