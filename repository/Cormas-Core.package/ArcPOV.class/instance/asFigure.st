private
asFigure
	
	| arcFig |
	arcFig := self class asFigure
		start: -30 @- 10
		stop: 30 @ 10.
	self stopAnnotation ifTrue: [arcFig addStopArrow].
	self startAnnotation ifTrue: [arcFig addCircleStart].
	arcFig lineWidth: self lineWidth.
	arcFig lineColor: self lineColor.
	arcFig model: self.
	^arcFig