Extension { #name : 'CMSpace3Neighbourhood' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> boundingRectangleHorizontalIntersection [
	
	^ 0.5
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood class >> exampleFlatTop [

	<example>
	^ (self new roassalMasterShape rotateByDegrees: 180) inspect
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood class >> examplePointyTop [

	<example>
	^ self new roassalMasterShape inspect
]

{ #category : '*Cormas-UI-Roassal3' }
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

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> roassalMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generateUnitNgonPoints: 3 rotation: 0);
		  size: 16;
		  yourself
]
