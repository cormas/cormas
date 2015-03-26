accessing
biomass: anObject
	"Setter accessor of attribute biomass "
	
	biomass = anObject ifTrue: [^nil].	"for optimization"
	biomass := anObject.
	self changed