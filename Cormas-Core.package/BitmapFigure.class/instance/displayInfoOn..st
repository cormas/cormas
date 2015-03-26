displaying
displayInfoOn: aGraphicsContext
	
	self info = #nil
		ifFalse:
			[infoText translateTo: self bounds origin.
			infoText displayFigureOn: aGraphicsContext]