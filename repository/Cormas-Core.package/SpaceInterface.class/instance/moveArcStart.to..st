display
moveArcStart: aArcRef to: aCellRef
	
	| aSelector |
	aSelector := self povMethodDicoAt: aArcRef entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveArcStart: aArcRef to: aCellRef