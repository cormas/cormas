Extension { #name : 'CMSpace6NeighbourhoodFlapTop' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlapTop class >> exampleRoassalMasterShape [

	<example>
	^ self new roassalMasterShape inspect
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlapTop >> roassalMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generatePointsFitSquare: 6);
		  yourself
]
