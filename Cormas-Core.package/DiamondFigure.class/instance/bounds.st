bounds accessing
bounds
	
	self points isEmpty ifTrue: [^super bounds].
	^self insetBounds