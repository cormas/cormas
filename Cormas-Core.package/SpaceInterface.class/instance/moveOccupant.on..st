display
moveOccupant: anOccupantReference on: aESEreference
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing moveOccupant: anOccupantReference on: aESEreference