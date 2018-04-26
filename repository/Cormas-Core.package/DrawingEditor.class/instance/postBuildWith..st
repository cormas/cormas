interface opening
postBuildWith: aBuilder
	
	super postBuildWith: aBuilder.
	builder window damageRepairPolicy: DoubleBufferingWindowDisplayPolicy new.
	builder window model == self
		ifTrue: [builder window label: self windowName]