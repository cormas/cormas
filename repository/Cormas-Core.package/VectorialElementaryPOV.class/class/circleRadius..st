instance creation
circleRadius: aNumber
	"ex : 

	(VectorialElementaryPOV circleRadius: 40) asFigure 
"

	^ self new outline: (Circle center: (aNumber / 2) @ aNumber / 2 radius: aNumber) asPolyline