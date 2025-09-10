Extension { #name : 'CMSpace6NeighbourhoodFlatTop' }

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlatTop >> boundingRectangleHorizontalIntersection [

	^ 0.25
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlatTop >> boundingRectangleVerticalShiftEven [

	^ 0.5
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlatTop class >> exampleRoassalMasterShape [

	<example>
	^ self new roassalMasterShape inspect
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlatTop >> organizeShapesPositions: aRSGroup [
	| point1 point2 outerRadius innerRadius numCol offset |
	
	point1 := aRSGroup first points first.
	point2 := aRSGroup first points second.
	
	"Radius of a circumcircle - a circle passing through all vertices of a hexagon"
	outerRadius := point1 distanceTo: point2.
	
	"Radius of an incircle - a circle passing through the middle of each side of a hexagon"
	innerRadius := 3 sqrt / 2 * outerRadius.
	
	aRSGroup do: [ :aShape |
		numCol := aShape model columnNumber - 1.
		
		offset := numCol odd
			ifTrue: [ (numCol * outerRadius / -2) @ innerRadius ] 
			ifFalse: [ (numCol * outerRadius / -2) @ 0 ].
			
		aShape translateBy: offset ]
]

{ #category : '*Cormas-UI-Roassal3' }
CMSpace6NeighbourhoodFlatTop >> roassalMasterShape [

	^ RSPolygon new
		  points: (RSPolygon generateUnitNgonPoints: 6 rotation: 0);
		  yourself
]
