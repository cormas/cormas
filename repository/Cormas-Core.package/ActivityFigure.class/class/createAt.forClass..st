instance creation
createAt: aPoint forClass: anEntityClass
	
	| inst |
	inst := self new.
	inst initializeForClass: anEntityClass.
	^inst
		translateTo: aPoint - inst bounds center;
		yourself	"center"