"
Triangular neighbourhood with alternating flat-topped and pointed-topped cells
"
Class {
	#name : 'CMSpace3Neighbourhood',
	#superclass : 'CMSpaceNeighbourhood',
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

{ #category : 'rendering' }
CMSpace3Neighbourhood >> cellCenterFor: aCell [
	| radius |
	
	"Radius of circumcircle if triangle is pointy top, radius of incircle if it's flat top"
	radius := (self shouldRotateShapeFor: aCell)
		ifTrue: [ 3 sqrt / 6 ]
		ifFalse: [ 3 sqrt / 3 ].

	^ 0.5 @ radius
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> initializeOrderedNeighbourhood: cellIndex forSpaceModel: aSpaceModel [
	"Set the neighbourhood of the cell at a givenIndex.
Neighbours are ordered anticlockwise, starting from the North cell"

	| v i |
	v := Array new: 3.
	"k isFlatTopTriangle?"
	(cellIndex odd
		 ifTrue: [ self class firstCellIsFlatTopTriangle ]
		 ifFalse: [ self class firstCellIsFlatTopTriangle not])
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
