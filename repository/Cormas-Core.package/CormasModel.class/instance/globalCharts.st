probes - charts
globalCharts
	
	^(self data includesKey: self class name)
		ifFalse: [OrderedCollection  new]
		ifTrue: [(self data at: self class name) keys]