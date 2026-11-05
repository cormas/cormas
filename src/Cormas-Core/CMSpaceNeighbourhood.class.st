"
This abstract class groups behavior for neighbourhood management of a CORMAS space model.
Subclasses should implement at least #initializeOrderedNeighbourhood: method to customize depending on the number of neighbours (k).

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	spaceModel:		<Object>


    Implementation Points
"
Class {
	#name : 'CMSpaceNeighbourhood',
	#superclass : 'Object',
	#instVars : [
		'numberOfRows',
		'numberOfColumns',
		'isClosedEnvironment'
	],
	#classInstVars : [
		'flatTopHexagons'
	],
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpaceNeighbourhood class >> cardinal [

	self subclassResponsibility
]

{ #category : 'testing' }
CMSpaceNeighbourhood class >> cardinalSymbol [

	self subclassResponsibility
]

{ #category : 'testing' }
CMSpaceNeighbourhood class >> isStartConditionFor: aSymbolOrNumber [

	^ aSymbolOrNumber = self cardinal or: [ aSymbolOrNumber == self cardinalSymbol ]
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalIntersection [
	"A proportion of a bounding rectangle that intersects horizontally - between the columns of a grid.
	By default, return 0, meaning that there is no intersection"
	
	^ 0
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalShiftEven [
	"A proportion of a bounding rectangle that will be shifted for the even rows"
	
	^ 0
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleHorizontalShiftOdd [
	"A proportion of a bounding rectangle that will be shifted for the odd rows"
	
	^ 0
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleVerticalIntersection [
	"A proportion of a bounding rectangle that intersects vertically - between the rows of a grid.
	By default, return 0, meaning that there is no intersection"
	
	^ 0
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleVerticalShiftEven [
	"A proportion of a bounding rectangle that will be shifted for the even columns"
	
	^ 0
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> boundingRectangleVerticalShiftOdd [
	"A proportion of a bounding rectangle that will be shifted for the odd columns"
	
	^ 0
]

{ #category : 'accessing' }
CMSpaceNeighbourhood >> cardinal [
	" See class side comment "
	
	^ self class cardinal
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> cellAt: aPoint startingFrom: aCell [
	"Answer the cell around a position on the grid, walking there from aCell through the cells closest to it"

	| current distanceTo closest |
	current := aCell.
	distanceTo := [ :each |
	              (self wayFrom: (self centerOnGridOf: each) to: aPoint)
		              r ].
	[
		closest := (self cellsToWalkThroughFrom: current) detectMin:
			           distanceTo.
		(distanceTo value: closest) < (distanceTo value: current) ]
		whileTrue: [ current := closest ].
	^ current
]

{ #category : 'rendering' }
CMSpaceNeighbourhood >> cellCenterFor: aCell [
	"Relative center of a shape assuming that the top-left corner of the bounding box is at 0@0 and the bottom-right corner is at 1@1"
	^ 0.5 @ 0.5
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> cellProportions [
	"Answer the width and height of the box around a cell, relative to its longest side"

	^ 1 @ 1
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> cellsToWalkThroughFrom: aCell [

	^ aCell neighbourhoodAndSelf
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> centerOnGridOf: aCell [

	^ self gridPositionOf: aCell at: (self cellCenterFor: aCell)
]

{ #category : 'utilities - space metrics' }
CMSpaceNeighbourhood >> distanceInClosedEnvironmentFromPoint: pointA toPoint: pointB [

	self subclassResponsibility
]

{ #category : 'utilities - space metrics' }
CMSpaceNeighbourhood >> distanceInOpenEnvironmentFromPoint: pointA toPoint: pointB [

	| m n pA pB distances |
	
	m := self numberOfRows.
	n := self numberOfColumns.
	
	pA := (pointA x + m) @ (pointA y + n).
	
	distances := #(0 1 2) flatCollect: [ :i |
		#(0 1 2) collect: [ :j |
			pB := (pointB x + (i * m)) @ (pointB y + (j * n)).
			self distanceInClosedEnvironmentFromPoint: pA toPoint: pB ] ].
	
	^ distances min
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> eastCell: k [
	k \\ self numberOfColumns = 0
		ifFalse: [ ^ k + 1 ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ k - (self numberOfColumns - 1) ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> gridCellShapeType [

	^ #regular
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> gridPositionOf: aCell at: aRelativePoint [
	"Answer a position on the whole grid, where one cell width is 1, from a position relative to the box around aCell"

	^ (self relativeOriginOfCell: aCell) + aRelativePoint
	  * self cellProportions
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> gridSize [
	"Answer the width and height of the whole grid, in the units of gridPositionOf:at:"

	^ self numberOfColumns
	  * (1 - self boundingRectangleHorizontalIntersection)
	  @
	  (self numberOfRows
	   * (1 - self boundingRectangleVerticalIntersection))
	  * self cellProportions
]

{ #category : 'initialization' }
CMSpaceNeighbourhood >> initializeNeighbourhoodFor: aSpaceModel [

	| numberOfCells |
	numberOfCells := self numberOfRows * self numberOfColumns.

	1 to: numberOfCells do: [ :i | 
		self initializeOrderedNeighbourhood: i forSpaceModel: aSpaceModel ].
]

{ #category : 'initialization' }
CMSpaceNeighbourhood >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
	"Set the neighbourhood of the cell at a given index.
	Neighbours are ordered anticlockwise, starting from the North cell (except for the pointy-top hexagons)"
	self subclassResponsibility
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> isClosedEnvironment [
	" Answer a <Boolean>. See comment in #isNotTorroidal "

	^ isClosedEnvironment
]

{ #category : 'accessing' }
CMSpaceNeighbourhood >> isClosedEnvironment: aBoolean [

	isClosedEnvironment := aBoolean
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> northCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k > self numberOfColumns
		ifTrue: [ ^ k - self numberOfColumns ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ self numberOfColumns * (self numberOfRows - 1) + k ]
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numCol: k [
	        ^k  -
	          ((k / self numberOfColumns) ceiling - 1
	           * self numberOfColumns).
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numRow: k [
	
	^ 1 max: ((k - 1) // (self numberOfColumns + 0) + 1)
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numberOfColumns [

	^ numberOfColumns
]

{ #category : 'accessing' }
CMSpaceNeighbourhood >> numberOfColumns: anInteger [

	numberOfColumns := anInteger
]

{ #category : 'as yet unclassified' }
CMSpaceNeighbourhood >> numberOfColumnsBetweenCell: cell1 andCell: cell2 [
	
	| number |
	number := (cell1 columnNumber - cell2 columnNumber) abs.
	
	self isClosedEnvironment ifTrue: [ ^ number ].
	
	^ number min: (self numberOfColumns - number)
]

{ #category : 'private - accessing' }
CMSpaceNeighbourhood >> numberOfNeighbours [

	^ self class cardinal
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numberOfRows [

	^ numberOfRows
]

{ #category : 'accessing' }
CMSpaceNeighbourhood >> numberOfRows: anInteger [

	numberOfRows := anInteger
]

{ #category : 'as yet unclassified' }
CMSpaceNeighbourhood >> numberOfRowsBetweenCell: cell1 andCell: cell2 [

	| number |
	number := (cell1 rowNumber - cell2 rowNumber) abs.
	
	self isClosedEnvironment ifTrue: [ ^ number ].
	
	^ number min: (self numberOfRows - number)
]

{ #category : 'rendering' }
CMSpaceNeighbourhood >> randomPointInCell: aCell using: aRandomNumberGenerator [

	| x y |
	x := aRandomNumberGenerator next.
	y := aRandomNumberGenerator next.
	
	^ x@y
]

{ #category : 'rendering' }
CMSpaceNeighbourhood >> randomPointInCell: aCell withPadding: aNumber using: aRandomNumberGenerator [

	| x y |
	x := aRandomNumberGenerator next.
	y := aRandomNumberGenerator next.
	
	^ x@y * (1 - (2 * aNumber)) + aNumber
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> relativeOriginOfCell: aCell [
	"Answer the top-left corner of the bounding box of aCell, in units of cell size, with 0@0 at the top-left corner of the grid. This accounts for the overlap of cell shapes such as hexagons or triangles, and for the shift of odd or even rows and columns."

	| distanceInCells overlap shift |
	distanceInCells := aCell columnNumber - 1 @ (aCell rowNumber - 1).

	overlap := self boundingRectangleHorizontalIntersection
	           @ self boundingRectangleVerticalIntersection.

	shift := (aCell rowNumber even
		          ifTrue: [ self boundingRectangleHorizontalShiftEven ]
		          ifFalse: [ self boundingRectangleHorizontalShiftOdd ])
	         @ (aCell columnNumber even
			          ifTrue: [ self boundingRectangleVerticalShiftEven ]
			          ifFalse: [ self boundingRectangleVerticalShiftOdd ]).

	^ distanceInCells - (distanceInCells * overlap) + shift
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> relativePositionOf: aPoint in: aCell [
	"Answer a position on the grid as relative to the box around aCell"

	^ (self wayFrom: (self gridPositionOf: aCell at: 0 @ 0) to: aPoint)
	  / self cellProportions
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> shortest: aDistance around: aLength [
	"When going directly is as short as going the other way, go directly"

	aDistance abs <= (aLength / 2) ifTrue: [ ^ aDistance ].
	^ aDistance - (aLength * (aDistance / aLength) rounded)
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> southCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k <= (self numberOfColumns * (self numberOfRows - 1))
		ifTrue: [ ^ k + self numberOfColumns ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ k - (self numberOfColumns * (self numberOfRows - 1)) ]
]

{ #category : 'geometry' }
CMSpaceNeighbourhood >> wayFrom: aPoint to: anotherPoint [
	"Answer the shortest vector between two positions on the grid. On a torus it can cross the edges of the grid"

	| way size |
	way := anotherPoint - aPoint.
	self isClosedEnvironment ifTrue: [ ^ way ].
	size := self gridSize.
	^ (self shortest: way x around: size x)
	  @ (self shortest: way y around: size y)
]

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> westCell: k [
"return K - 1, if k is not on the 1st column.
If k is 1st col & grid close => 0. If torroid => k + column - 1"
	k \\ self numberOfColumns = 1 ifFalse: [ ^ k - 1 ].
	^ self isClosedEnvironment
		  ifTrue: [ 0 ]
		  ifFalse: [ k + self numberOfColumns - 1 ]
]
