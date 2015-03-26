probes - charts
localCharts
	
	| list |
	list := OrderedCollection new.
	self class allClasses
		do:
			[:cl | 
			(self data includesKey: cl name)
				ifTrue: [list addAll: (self data at: cl name) keys]].
	^list