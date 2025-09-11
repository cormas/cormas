Extension { #name : 'CMSpace3Neighbourhood' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> boundingRectangleHorizontalIntersection [
	
	^ 0.5
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> cellShapeOriginOffset [

	^ 0.5@0
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> centerOfShapeFor: aCell [
	| radius |
	
	"Radius of circumcircle if triangle is pointy top, radius of incircle if it's flat top"
	radius := (self shouldRotateShapeFor: aCell)
		ifTrue: [ 3 sqrt / 6 ]
		ifFalse: [ 3 sqrt / 3 ].

	^ 0.5 @ radius
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
	"Move shapes to fit align them with each other"

	| r numCol |
	r := aRSGroup first encompassingRectangle width.

	aRSGroup do: [ :aShape |
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

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> rotateShapes: aRSGroup [
	"Reverse the triangles when id is even. "

	aRSGroup do: [ :aShape |
		(self shouldRotateShapeFor: aShape model) ifTrue: [ aShape rotateByDegrees: 180 ] ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace3Neighbourhood >> shouldRotateShapeFor: aCell [

	^ (aCell rowNumber + aCell columnNumber +
		(self class firstCellIsFlatTopTriangle ifTrue: [ 0 ] ifFalse: [ 1 ])) even
]
