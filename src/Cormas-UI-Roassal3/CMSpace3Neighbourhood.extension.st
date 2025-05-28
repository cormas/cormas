Extension { #name : 'CMSpace3Neighbourhood' }

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
CMSpace3Neighbourhood >> roassalMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generatePointsFitSquare: 3);
		  size: 16;
		  yourself
]
