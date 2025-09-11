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
