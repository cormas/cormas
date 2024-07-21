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
		'activeSpatialEntity',
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
		'isClosedEnvironment',
		'numberOfRows',
		'numberOfColumns'
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
CMSpaceModel >> activePoVsDictionary [
	" Answer a <Dictionary> containing the initial active points of view of the receiver's model "

	^ activePoVsDictionary
		ifNil: [ activePoVsDictionary := Dictionary new ]
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

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> cellAt: aRowIndex at: aColumnIndex [
	
	^ self elementaryEntities at: (aRowIndex - 1) * numberOfColumns + aColumnIndex
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
	(numberOfRows even or: [ numberOfColumns even ])
		ifTrue: [ ^ self error: 'Grid dimensions is not odd' ].
	^ self elementaryEntities at: (numberOfRows * numberOfColumns / 2) asInteger + 1
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

	| cells |

	self cormasModelClass cellClass currentId: 0.
	
	cells := (1 to: self gridSize) collect: [ :i |
		self newEntity: self cormasModelClass cellClass ].
	
	self elementaryEntities: cells asArray.
]

{ #category : 'defaults' }
CMSpaceModel >> defaultGridSize [
	" Answer a <Number> representing how many cells we create in the grid by default "
	
	^ 100
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
	
	^ self numberOfColumns @ self numberOfRows
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
		ifFalse: [ nbLines > (self numberOfRows - 2)
				ifTrue: [ nbLines := nbLines - self numberOfRows + 2 ].
			nbCols > (self numberOfColumns - 2)
				ifTrue: [ nbCols := nbCols - self numberOfColumns + 2 ] ].
	^ self nbConfiguration distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols.

]

{ #category : 'landscape indices' }
CMSpaceModel >> dominance: attribute [
	"Compute dominance according to the attribute"

	| numberCells sum n pi classes |
	numberCells := self numberOfRows * self numberOfColumns.
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
	numberOfRows := nil.
	numberOfColumns := nil.
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

{ #category : 'private - accessing' }
CMSpaceModel >> line: i column: j [
	" Configure receiver's number of lines to be i and number of columns to be j "

	numberOfRows := i.
	numberOfColumns := j.
	gridSize := i * j
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerLeftLocation [
	^ self elementaryEntities at: numberOfColumns * (numberOfRows - 1) + 1
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> lowerRightLocation [
	^ self elementaryEntities at: numberOfColumns * numberOfRows
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
CMSpaceModel >> numberOfRows [
	" Answer the <Number> of rows of the receiver's grid "
	
	^ numberOfRows
		ifNil: [ numberOfRows := self class defaultNumberOfRows ]
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

	^ self selectRandomlyFrom: self elementaryEntities
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

{ #category : 'accessing' }
CMSpaceModel >> setBoundaryDirectionsFor: aCMSpatialEntity [
	" Answer a <Collection> of direction (ex: (#E #SE #NE)) of the cell, without cell => the edge of the grid"

	^ self nbConfiguration setBoundaryDirectionsFor: aCMSpatialEntity
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

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperLeftLocation [
	^ self elementaryEntities at: 1
]

{ #category : 'ESE (regular) - special locations' }
CMSpaceModel >> upperRightLocation [
	^ self elementaryEntities at: numberOfColumns
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
