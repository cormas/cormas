- accessing - methods & classes
genericEntities
	
	| kernel |
	kernel := CMEntity cmEnvironment.
	^ CMEntity withAllSubclasses select: [ : cl | cl cmEnvironment = kernel]