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

{ #category : 'accessing' }
CMSpaceNeighbourhood >> cardinal [
	" See class side comment "
	
	^ self class cardinal
]

{ #category : 'rendering' }
CMSpaceNeighbourhood >> cellCenterFor: aCell [
	"Relative center of a shape assuming that the top-left corner of the bounding box is at 0@0 and the bottom-right corner is at 1@1"
	^ 0.5 @ 0.5
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

{ #category : 'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> westCell: k [
"return K - 1, if k is not on the 1st column.
If k is 1st col & grid close => 0. If torroid => k + column - 1"
	k \\ self numberOfColumns = 1 ifFalse: [ ^ k - 1 ].
	^ self isClosedEnvironment
		  ifTrue: [ 0 ]
		  ifFalse: [ k + self numberOfColumns - 1 ]
]
