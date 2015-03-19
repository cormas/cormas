accessing
energy: anObject
	"Setter accessor of attribute energy "
	
	energy = anObject ifTrue: [^nil].	"for optimization"
	energy := anObject.
	self changed