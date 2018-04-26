display
displayOn: aGC
	
	super displayOn: aGC.
	self class referencedBounds: self bounds.
	self figure notNil
		ifTrue:
			[self figure isBitmapFigure
				ifTrue:
					[self figure
						displayOn: aGC
						at: self bounds center - (self figure bounds extent / 2)]
				ifFalse:
					[self figure
						displayOn: aGC
						at: self bounds center]]