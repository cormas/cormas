actions
addClass
	
	| diff |
	classes list size = 1
		ifTrue: [diff := 1]
		ifFalse:
			[diff := classes list last y asNumber
				- (classes list at: classes list size - 1) y asNumber].
	classes list
		add:
			(Point
				x: classes list last y
				y: (classes list last y asNumber + diff) printString)