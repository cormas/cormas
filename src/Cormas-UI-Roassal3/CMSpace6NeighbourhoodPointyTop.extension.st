Extension { #name : 'CMSpace6NeighbourhoodPointyTop' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodPointyTop >> boundingRectangleVerticalIntersection [

	^ 0.25
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodPointyTop class >> example [

	<example>
	^ self new roassalMasterShape inspect
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodPointyTop class >> exampleRoassalMasterShape [

	<example>
	^ self new roassalMasterShape inspect
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodPointyTop >> roassalMasterShape [

	^ RSPolygon new
		points: (RSPolygon generatePointsFitSquare: 6);
		rotateByDegrees: 90;
		yourself
]
