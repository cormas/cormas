displaying
displayInfoOn: aGraphicsContext
	
	self info = #nil ifTrue: [^nil].
	[infoText
		translateTo: self bounds center - ((self info size / 2) ceiling @ 12)]
		on: GenericException
		do: [:ex | nil].
	self pov = #delimitors
		ifTrue: [infoText lineColor: ColorValue black]
		ifFalse:
			[self fillColor brightness < 0.4
				ifTrue: [infoText lineColor: ColorValue white]
				ifFalse: [infoText lineColor: ColorValue black]].
	infoText displayFigureOn: aGraphicsContext