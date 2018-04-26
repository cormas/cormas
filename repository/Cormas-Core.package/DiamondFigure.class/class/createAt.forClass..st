instance creation
createAt: aPoint forClass: anEntityClass
	
	| inst |
	inst := self withPoints: VectorialElementaryPOV diamond outline vertices.	""
	inst initializeForClass: anEntityClass.
	^inst
		translateTo: aPoint - (26 @ 26);
		yourself