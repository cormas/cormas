ESE (regular) - gradient creation
setLinearGradientForAttribute: aString centralValue: cv borderValue: bv
	
	| distanceCenterToBorder x |
	(self line odd not or: [self column odd not])
		ifTrue:
			[^self cormas
				warn: (UserMessage defaultString: '' key: #gridDimensionsNotOdd)].
	self elementaryEntities
		do:
			[:c | 
			c
				perform: (aString , ':') asSymbol
				with: #undefined].
	distanceCenterToBorder := ((self line max: self column) - 1) / 2.
	self centralLocation
		perform: (aString , ':') asSymbol
		with: cv.
	1
		to: distanceCenterToBorder
		do:
			[:index | 
			(self centralLocation peripherieRayon: index)
				do:
					[:c | 
					x := cv + ((bv - cv) / distanceCenterToBorder * index).
					c
						perform: (aString , ':') asSymbol
						with: x asFloat]].
	(self elementaryEntities
		select: [:c | (c perform: aString asSymbol) = #undefined])
		do:
			[:c | 
			c
				perform: (aString , ':') asSymbol
				with: bv]