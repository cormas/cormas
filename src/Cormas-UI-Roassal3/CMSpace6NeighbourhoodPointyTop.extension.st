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
CMSpace6NeighbourhoodPointyTop >> organizeShapesPositions: aRSGroup [
	| point1 point2 outerRadius innerRadius numLine offset |
	
	point1 := aRSGroup first points first.
	point2 := aRSGroup first points second.
	
	"Radius of a circumcircle - a circle passing through all vertices of a hexagon"
	outerRadius := point1 distanceTo: point2.
	
	"Radius of an incircle - a circle passing through the middle of each side of a hexagon"
	innerRadius := 3 sqrt / 2 * outerRadius.
	
	aRSGroup do: [ :aShape |
		numLine := aShape model rowNumber - 1.
		
		offset := numLine odd
			ifTrue: [ innerRadius @ (numLine * outerRadius / -2) ]
			ifFalse: [ 0 @ (numLine * outerRadius / -2) ].
			
		aShape translateBy: offset ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodPointyTop >> roassalMasterShape [

	^ RSPolygon new
		points: (RSPolygon generatePointsFitSquare: 6);
		rotateByDegrees: 90;
		yourself
]
