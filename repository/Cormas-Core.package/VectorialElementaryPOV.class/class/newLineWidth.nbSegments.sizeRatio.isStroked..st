instance creation
newLineWidth: lw nbSegments: nbs sizeRatio: sr isStroked: bool
	"ex : (VectorialElementaryPOV newLineWidth: 3 nbSegments: 5 sizeRatio: 1.5 isStroked: false) asFigure   "
	
	| inst |
	inst := self new.
	inst lineWidth: lw.
	inst sizeRatio: sr.
	inst isStroked: bool.
	inst nbSegments: nbs.
	^inst