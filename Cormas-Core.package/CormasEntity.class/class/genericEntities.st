as yet unclassified
genericEntities
	
	| kernel |
	kernel := CormasEntity environment.
	^CormasEntity withAllSubclasses select: [:cl | cl environment = kernel]