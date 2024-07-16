Extension { #name : 'GPolygon' }

{ #category : '*Cormas-Core' }
GPolygon >> asPolyline [

	^ self.
]

{ #category : '*Cormas-Core' }
GPolygon >> scaledBy: amount [ 
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."

	^ self species vertices: (vertices collect: [ : v | v * amount])
]

{ #category : '*Cormas-Core' }
GPolygon >> translatedBy: amount [ 
	"Answer a new object translated by amount, which can be
	a Point or a scalar value."

	| nv gPoint |
	
	gPoint := amount asGPoint.
	nv := vertices collect: [: v | v + gPoint ].
	^ self species vertices: nv
]
