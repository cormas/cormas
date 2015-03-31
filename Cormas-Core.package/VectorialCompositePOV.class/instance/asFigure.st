private
asFigure
	
	| instFigure |
	"	instFigure := self class asFigure newFromPOV: self ."
	instFigure := CompositeEntityFigure newFromPOV: self.
	instFigure model: self.
	self isStroked
		ifFalse:
			[instFigure
				opaque;
				fillColor: self color]
		ifTrue: [instFigure transparent].
	instFigure scaleBy: self sizeRatio.
	instFigure lineWidth: self lineWidth.
	instFigure lineColor: self lineColor.
	^instFigure