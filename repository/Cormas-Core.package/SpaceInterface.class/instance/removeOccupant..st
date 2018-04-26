display
removeOccupant: anOccupantReference
	
	| aSelector |
	aSelector := self povMethodDicoAt: anOccupantReference entityClass.
	aSelector = #nil ifTrue: [^nil].
	self drawing removeOccupant: anOccupantReference