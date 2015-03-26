run
createSheets: number
	
	self sheets: OrderedCollection new.
	1
		to: number
		do:
			[:index | 
			index <= 3
				ifTrue: [self setWorksheet: 4 - index]
				ifFalse:
					[self addWorksheet.
					self setWorksheet: 1]]