display
moveArcStop: aArcRef to: stopCellReference
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStop: aArcRef to: stopCellReference