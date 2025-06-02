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
CMSpace6NeighbourhoodPointyTop class >> exampleGrid [

	<example>
| grid agent1 agent2 |
grid := HexGrid new initializeRadius: 1.

agent1 := HexAgent new.
grid addAgent: agent1 toCell: (grid cellDictionary at: (HexCoordinate fromAxialQ: 0 r: 0)).

agent2 := HexAgent new.
grid addAgent: agent2 toCell: (grid cellDictionary at: (HexCoordinate fromAxialQ: 1 r: -1)).

grid visualize.
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
