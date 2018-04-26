probes - charts
localChartsForEntity: aName
	
	| list |
	list := OrderedCollection new.
	(self data includesKey: aName)
		ifTrue: [list addAll: (self data at: aName) keys].
	^list