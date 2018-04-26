adding-removing
addFigure: aFigure
	"Add aFigure, adapted to my bounds"
	
	aFigure isDistortable
		ifFalse:
			[| sf |
			sf := self scaleFactor.
			sf := (sf x min: sf y) @ (sf x min: sf y).
			aFigure scaleBy: sf].
	^self add: (self adaptFigure: aFigure)