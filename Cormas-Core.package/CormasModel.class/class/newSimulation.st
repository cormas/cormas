instance creation
newSimulation
	
	| sim |
	sim := super new.	"sim initialize.   d√©ja appel√© par new"
	self currentSimulation: sim.
	^sim