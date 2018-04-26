connection
canConnectToFigure: aFigure
	
	aFigure = self
		ifTrue:
			[Dialog warn: 'Unauthorized  connection'.
			^false].
	aFigure class = StartFigure
		ifTrue:
			[Dialog warn: 'Unauthorized  connection'.
			^false].
	self isAlreadyConnected
		ifTrue:
			[Dialog warn: 'Only 2 transitions per test : True & False'.
			^false].
	^super canConnectToFigure: aFigure