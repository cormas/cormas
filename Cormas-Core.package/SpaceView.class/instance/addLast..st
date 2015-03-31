adding-removing
addLast: anOriginalFigure
	"Add a COPY of anOriginalFigure, adapted to my bounds"
	
	| aCloneFig |
	aCloneFig := anOriginalFigure copy.
	aCloneFig model: anOriginalFigure.
	^super addLast: (self adaptFigure: aCloneFig)