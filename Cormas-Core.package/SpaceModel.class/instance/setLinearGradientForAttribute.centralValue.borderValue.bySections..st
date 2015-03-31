ESE (regular) - gradient creation
setLinearGradientForAttribute: aString centralValue: cv borderValue: bv bySections: anArray
	
	| distanceCenterToBorder allSections startIndex startValue endIndex endValue i x |
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
	allSections := Array new: anArray size + 1.
	1
		to: anArray size
		do:
			[:j | 
			allSections
				at: j
				put: (anArray at: j)].
	allSections
		at: anArray size + 1
		put: #(1 1).
	startIndex := 0.
	startValue := cv.
	allSections
		do:
			[:twoValues | 
			endIndex := (distanceCenterToBorder * twoValues first) rounded.
			endValue := cv + (twoValues last * (bv - cv)).
			i := 0.
			startIndex + 1
				to: endIndex
				do:
					[:index | 
					i := i + 1.
					(self centralLocation peripherieRayon: index)
						do:
							[:c | 
							x := startValue + ((endValue - startValue) / (endIndex - startIndex) * i).
							c
								perform: (aString , ':') asSymbol
								with: x asFloat]].
			startIndex := endIndex.
			startValue := endValue].
	(self elementaryEntities
		select: [:c | (c perform: aString asSymbol) = #undefined])
		do:
			[:c | 
			c
				perform: (aString , ':') asSymbol
				with: endValue]