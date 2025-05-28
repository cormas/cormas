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

{ #category : 'testing' }
CMSpace3Neighbourhood class >> exampleFlatTop [

	<example>
	^ (self new getMasterShape rotateByDegrees: 180) inspect
]

{ #category : 'testing' }
CMSpace3Neighbourhood class >> examplePointyTop [

	<example>
	^ self new getMasterShape inspect
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
CMSpace3Neighbourhood >> getMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generatePointsFitSquare: 3);
		  size: 16;
		  yourself
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> initializeOrderedNeighbourhood: k [
	"Set the neighbourhood of the cell with id = k.
Neighbours are ordered anticlockwise, starting from the North cell"

	| v i |
	v := Array new: 3.
	"k isFlatTopTriangle?"
	(k odd
		 ifTrue: [ CMSpace3Neighbourhood firstCellIsFlatTopTriangle ]
		 ifFalse: [ CMSpace3Neighbourhood firstCellIsFlatTopTriangle not])
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

{ #category : 'initialization' }
CMSpace3Neighbourhood >> organizeShapesPositions2: aRSGroup [
	"Reverse the triangles when id is even. "

	| i r numCol |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].
	r := aRSGroup first encompassingRectangle width.
	aRSGroup do: [ :aShape |
		i := i + 1.
		i even ifTrue: [ aShape rotateByDegrees: 180 ].
		(aShape model columnNumber = self numberOfColumns and: [
			 self numberOfColumns even ]) ifTrue: [ i := i + 1 ].
		"aShape model rowNumber even ifTrue: [ "aShape scaleBy: 1.5 @ 1 .
		numCol := aShape model columnNumber.
		aShape translateBy: 0.5 * numCol * (r / -2 @ 0) ]
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> organizeShapesPositions: aRSGroup [
	"Reverse the triangles when id is even. "

	| i r numCol |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].
	r := aRSGroup first encompassingRectangle width.
	aRSGroup do: [ :aShape |
		i := i + 1.
		i even ifTrue: [ aShape rotateByDegrees: 180 ].
		(aShape model columnNumber = self numberOfColumns and: [
			 self numberOfColumns even ]) ifTrue: [ i := i + 1 ].
		numCol := aShape model columnNumber.
		aShape translateBy: numCol * (r / -2 @ 0) ]
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> organizeShapesPositions: aRSGroup for2: aCanvas [
	"Reverse the triangles when id is even. "

	| i r numCol canvasExtent |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].
	r := aRSGroup first encompassingRectangle extent. "width"
	"self halt."
	canvasExtent := aCanvas extent. "container"
	r := r * self numberOfColumns / canvasExtent. "x"
	"r := canvasExtent x / self numberOfColumns * r."
	aRSGroup do: [ :aShape |
		i := i + 1.
		i even ifTrue: [ aShape rotateByDegrees: 180 ].
		(aShape model columnNumber = self numberOfColumns and: [
			 self numberOfColumns even ]) ifTrue: [ i := i + 1 ].
		numCol := aShape model columnNumber.
		"aShape scaleBy:  self numberOfColumns / canvasExtent x * aShape encompassingRectangle extent."
		aShape scaleBy: r.
		aShape translateBy: numCol * (r / -2)
		"numCol * ((aShape encompassingRectangle extent x / -2) @ 0)" "@ 0" ]
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> organizeShapesPositions: aRSGroup toFit: aCanvas [
	"Reverse the triangles when id is even. "

	| i r numCol |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].
	r := aRSGroup first encompassingRectangle width. "geometry"
	r := r * self numberOfColumns / aCanvas extent x.
	aRSGroup do: [ :aShape |
		i := i + 1.
		i even ifTrue: [ aShape rotateByDegrees: 180 ].
		(aShape model columnNumber = self numberOfColumns and: [
			 self numberOfColumns even ]) ifTrue: [ i := i + 1 ].
		numCol := aShape model columnNumber.
		aShape scaleBy:  3@1 "aCanvas extent / self numberOfColumns / self numberOfRows" .
		aShape translateBy:
			numCol * (aShape encompassingRectangle width / 2 @ 0)
		"aShape translateBy: numCol * (r / -2 @ 0) " ].

	aCanvas color: Color blue.
	aCanvas invalidate
]

{ #category : 'initialization' }
CMSpace3Neighbourhood >> organizeShapesPositionsOK: aRSGroup [
	"Reverse the triangles when id is even. "

	| i r numCol |
	i := self class firstCellIsFlatTopTriangle
		     ifTrue: [ 1 ]
		     ifFalse: [ 0 ].
	r := aRSGroup first encompassingRectangle width.
	aRSGroup do: [ :aShape |
		i := i + 1.
		i even ifTrue: [ aShape rotateByDegrees: 180 ].
		(aShape model columnNumber = self numberOfColumns and: [
			 self numberOfColumns even ]) ifTrue: [ i := i + 1 ].
		numCol := aShape model columnNumber.
		aShape translateBy: numCol * (r / -2 @ 0) ]
]
