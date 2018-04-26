connection
canConnectToFigure: aFigure
	
	aFigure = self
		ifTrue:
			[self cormas warn: 'Unauthorized  connection'.
			^false].
	aFigure class = StartFigure
		ifTrue:
			[self cormas warn: 'Unauthorized  connection'.
			^false].
	self isAlreadyConnected
		ifTrue:
			[self cormas warn: 'Only one transition per activity'.
			^false].
	^super canConnectToFigure: aFigure