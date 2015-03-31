adapting
adaptFigure: aFigure
	"scaleFactor := self bounds extent / self model spaceModel absoluteBounds extent."
	
	^aFigure scaleByWithConstraints: self scaleFactor