view creation
inspect: anEntityReference spaceInterface: aSI
	"(self hasOneInstanceToBeTheOnlyOneFor: aSI)
	ifTrue:[(self theOnlyOneInstanceFor: aSI) goToEntity: anEntityReference]
	ifFalse:[self new openOn: anEntityReference spaceInterface: aSI]
"
	
	self new openOn: anEntityReference spaceInterface: aSI