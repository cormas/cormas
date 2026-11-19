"
Triangular neighbourhood with alternating flat-topped and pointed-topped cells
"
Class {
	#name : 'CMSpace3Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
	#instVars : [
		'isPreviousIndexForFlatTopTriangle'
	],
	#classInstVars : [
		'firstCellIsFlatTopTriangle'
	],
	#category : 'Cormas-Core-Space',
	#package : 'Cormas-Core',
	#tag : 'Space'
}

{ #category : 'testing' }
CMSpace3Neighbourhood class >> cardinal [

	^3
]

{ #category : 'testing' }
CMSpace3Neighbourhood class >> cardinalSymbol [

	^#three
]

{ #category : 'accessing' }
CMSpace3Neighbourhood class >> firstCellIsFlatTopTriangle [

	^ firstCellIsFlatTopTriangle ifNil: [ firstCellIsFlatTopTriangle := false]
]

{ #category : 'accessing' }
CMSpace3Neighbourhood class >> firstCellIsFlatTopTriangle: aBoolean [

	firstCellIsFlatTopTriangle := aBoolean
]

{ #category : 'testing' }
CMSpace3Neighbourhood class >> isStartConditionFor: aSymbolOrNumber [
"Test: self isStartConditionFor: 3 "

	^ super isStartConditionFor: aSymbolOrNumber
]

{ #category : 'geometry' }
CMSpace3Neighbourhood >> boundingRectangleHorizontalIntersection [
	
	^ 0.5
]

{ #category : 'rendering' }
CMSpace3Neighbourhood >> cellCenterFor: aCell [
	| radius |
	
	"Radius of circumcircle if triangle is pointy top, radius of incircle if it's flat top"
	radius := (self shouldRotateShapeFor: aCell)
		ifTrue: [ 3 sqrt / 6 ]
		ifFalse: [ 3 sqrt / 3 ].

	^ 0.5 @ radius
]

{ #category : 'geometry' }
CMSpace3Neighbourhood >> cellsToWalkThroughFrom: aCell [
	"All three neighbours of a triangle can be further from a position than the triangle itself, even when the position is in another cell, so a walk through them alone can stop too early"

	^ (aCell neighbourhoodOfRadius: 2) copyWith: aCell
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
	"Set the neighbourhood of the cell at a givenIndex.
Neighbours are ordered anticlockwise, starting from the North cell"

	| v i |
	v := Array new: 3.
	(self isIndexForFlatTopTriangle: cellIndex)
		ifTrue: [
				(i := self northCell: cellIndex) > 0 ifTrue: [
					v at: 1 put: (aSpaceModel cellAt: i) ].
				(i := self westCell: cellIndex) > 0 ifTrue: [
					v at: 2 put: (aSpaceModel cellAt: i) ].
				(i := self eastCell: cellIndex) > 0 ifTrue: [
					v at: 3 put: (aSpaceModel cellAt: i) ] ]
		ifFalse: [
				(i := self westCell: cellIndex) > 0 ifTrue: [
					v at: 1 put: (aSpaceModel cellAt: i) ].
				(i := self southCell: cellIndex) > 0 ifTrue: [
					v at: 2 put: (aSpaceModel cellAt: i) ].
				(i := self eastCell: cellIndex) > 0 ifTrue: [
					v at: 3 put: (aSpaceModel cellAt: i) ] ].

	^ (aSpaceModel cellAt: cellIndex) neighbourhoodWithNils: v
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> isIndexForFlatTopTriangle: cellIndex [
	"Ask if cellIndex is for a FlatTopTriangle, using the isPreviousIndexForFlatTopTriangle attribute"

	isPreviousIndexForFlatTopTriangle "or (cellIndex = 1)" 
		ifNil: [^ isPreviousIndexForFlatTopTriangle := self class firstCellIsFlatTopTriangle ].
	numberOfColumns odd ifTrue: [
			^ isPreviousIndexForFlatTopTriangle := isPreviousIndexForFlatTopTriangle not ].
	((cellIndex - 1) \\ numberOfColumns) = 0
		ifTrue: [ ^ isPreviousIndexForFlatTopTriangle ]
		ifFalse: [ ^ isPreviousIndexForFlatTopTriangle := isPreviousIndexForFlatTopTriangle not ]
]

{ #category : 'testing' }
CMSpace3Neighbourhood >> shouldRotateShapeFor: aCell [

	^ (aCell rowNumber + aCell columnNumber +
		(self class firstCellIsFlatTopTriangle ifTrue: [ 0 ] ifFalse: [ 1 ])) even
]
