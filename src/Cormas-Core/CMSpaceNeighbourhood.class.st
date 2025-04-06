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
	#name : #CMSpaceNeighbourhood,
	#superclass : #Object,
	#traits : 'TCMRandom',
	#classTraits : 'TCMRandom classTrait',
	#instVars : [
		'spaceModel'
	],
	#category : 'Cormas-Core-Space'
}

{ #category : #testing }
CMSpaceNeighbourhood class >> cardinal [

	self subclassResponsibility
]

{ #category : #testing }
CMSpaceNeighbourhood class >> cardinalSymbol [

	self subclassResponsibility
]

{ #category : #accessing }
CMSpaceNeighbourhood class >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [

	^ cell1 distanceCell: cell2	

]

{ #category : #'instance creation' }
CMSpaceNeighbourhood class >> forNeighbours: aNumberOrSymbol spaceModel: aCMSpaceModel [
	" Answer a new instance of the receiver accordingly to the number of neighbours specified in aSymborOrNumberNeighbours "
	
	^ self concreteSubclasses
		detect: [ : nbSubclass | nbSubclass isStartConditionFor: aNumberOrSymbol ]
		ifFound: [ : nbSubclass | nbSubclass new initializeOn: aCMSpaceModel ]
		ifNone: [ self error: 'Should not happen' ]
]

{ #category : #testing }
CMSpaceNeighbourhood class >> isStartConditionFor: aSymbolOrNumber [

	^ aSymbolOrNumber = self cardinal or: [ aSymbolOrNumber == self cardinalSymbol ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> cardinal [
	" See class side comment "
	
	^ self class cardinal
]

{ #category : #accessing }
CMSpaceNeighbourhood >> distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols [

	^ self class distanceFromCell: cell1 toCell: cell2 nbLines: nbLines nbCols: nbCols
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> eastCell: k [
	k \\ self numberOfColumns = 0
		ifFalse: [ ^ k + 1 ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ k - (self numberOfColumns - 1) ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> elementaryEntitiesAt: anInteger [
	" Answer a <Collection> of <CMSpatialEntity> cells at index anInteger "

	^ self spaceModel cells at: anInteger
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> gridCellShapeType [

	^ #regular
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeNeighbourhood [
	" Private - Initialize aSpaceModel neighbourhood values based on the receiver "

	1 to: self spaceModel gridSize do: [ :k | 
		(self elementaryEntitiesAt: k) ifNotNil: [ 
			self initializeOrderedNeighbourhood: k ] ].
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeOn: aSpaceModel [
	" Private - Create a new instance of grid. Initialize aSpaceModel neighbourhood values based on the receiver "

	aSpaceModel gridCellShape: self gridCellShapeType.
	self spaceModel: aSpaceModel.

	spaceModel createCells.
	self initializeNeighbourhood
]

{ #category : #initialization }
CMSpaceNeighbourhood >> initializeOrderedNeighbourhood: k [

	self subclassResponsibility
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> isClosedEnvironment [
	" Answer a <Boolean>. See comment in #isNotTorroidal "

	^ self spaceModel isClosedEnvironment
]

{ #category : #'environment - sensing - space' }
CMSpaceNeighbourhood >> nearestEmptyCellFor: aCMAgentLocation [
	
	^ (aCMAgentLocation nearestEmptyNeighborsWithinRadius: (self spaceModel numberOfRows max: self spaceModel numberOfColumns))
		ifNotEmpty: [ : locations | self selectRandomlyFrom: locations ]
		ifEmpty: [ nil ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> northCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k > self numberOfColumns
		ifTrue: [ ^ k - self numberOfColumns ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ self numberOfColumns * (self numberOfRows - 1) + k ]
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numberOfColumns [

	^ self spaceModel numberOfColumns
]

{ #category : #'private - accessing' }
CMSpaceNeighbourhood >> numberOfNeighbours [

	^ self class cardinal
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> numberOfRows [

	^ self spaceModel numberOfRows
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> southCell: k [
	k = 0
		ifTrue: [ ^ 0 ].
	k <= (self numberOfColumns * (self numberOfRows - 1))
		ifTrue: [ ^ k + self numberOfColumns ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ k - (self numberOfColumns * (self numberOfRows - 1)) ]
]

{ #category : #accessing }
CMSpaceNeighbourhood >> spaceModel [

	^ spaceModel
]

{ #category : #accessing }
CMSpaceNeighbourhood >> spaceModel: aCMSpaceModel [

	spaceModel := aCMSpaceModel
]

{ #category : #'private - regular cells - instance creation' }
CMSpaceNeighbourhood >> westCell: k [

	k \\ self numberOfColumns = 1
		ifFalse: [ ^ k - 1 ].
	^ self isClosedEnvironment
		ifTrue: [ 0 ]
		ifFalse: [ k + self numberOfColumns - 1 ]
]
