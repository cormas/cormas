Extension { #name : #Rectangle }

{ #category : #'*Cormas-Core' }
Rectangle >> asPolyline [
	"Answer a point array representing myself as a polyline."
	| polyline |

	polyline := Array new: 5.
	polyline
		at: 1 put: self topLeft;
		at: 2 put: self topRight;
		at: 3 put: self bottomRight;
		at: 4 put: self bottomLeft;
		at: 5 put: self topLeft.
	^ GPolygon newVertices: polyline
]
