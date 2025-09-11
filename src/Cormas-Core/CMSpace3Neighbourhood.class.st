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

{ #category : 'initialization' }
CMSpace3Neighbourhood >> initializeOrderedNeighbourhood: k [
	"Set the neighbourhood of the cell with id = k.
Neighbours are ordered anticlockwise, starting from the North cell"

	| v i |
	v := Array new: 3.
	"k isFlatTopTriangle?"
	(k odd
		 ifTrue: [ self class firstCellIsFlatTopTriangle ]
		 ifFalse: [ self class firstCellIsFlatTopTriangle not])
		ifTrue: [
			(i := self northCell: k) > 0 ifTrue: [
				v at: 1 put: (self elementaryEntitiesAt: i) ].
			(i := self westCell: k) > 0 ifTrue: [
				v at: 2 put: (self elementaryEntitiesAt: i) ].
			(i := self eastCell: k) > 0 ifTrue: [
				v at: 3 put: (self elementaryEntitiesAt: i) ] ]
		ifFalse: [
			(i := self westCell: k) > 0 ifTrue: [
				v at: 1 put: (self elementaryEntitiesAt: i) ]. 
			(i := self southCell: k) > 0 ifTrue: [
				v at: 2 put: (self elementaryEntitiesAt: i) ].
			(i := self eastCell: k) > 0 ifTrue: [
				v at: 3 put: (self elementaryEntitiesAt: i) ] ].

	^ (self elementaryEntitiesAt: k) neighbourhoodWithNils: v
]

{ #category : 'as yet unclassified' }
CMSpace3Neighbourhood >> rotateShapes: aRSGroup [
	"Reverse the triangles when id is even. "

	| i |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].

	aRSGroup do: [ :aShape |
			i := i + 1.
			i even ifTrue: [ aShape rotateByDegrees: 180 ].
			
			(aShape model columnNumber = self numberOfColumns and: [
				 self numberOfColumns even ]) ifTrue: [ i := i + 1 ] ]
]
