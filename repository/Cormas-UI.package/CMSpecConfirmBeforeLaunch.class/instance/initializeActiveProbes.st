initialization
initializeActiveProbes

	(self cormasModelClass activeProbes 
		ifNotNil: [ : m | self probesList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self probesList selectItem: self cormasModelClass activeProbes ]
			.