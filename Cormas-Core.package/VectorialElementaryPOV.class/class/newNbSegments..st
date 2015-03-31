instance creation
newNbSegments: nbSegments
	"ex : (VectorialElementaryPOV newNbSegments: 8) asFigure   "
	
	| inst |
	inst := self new.
	inst calculPolyline: nbSegments.
	^inst