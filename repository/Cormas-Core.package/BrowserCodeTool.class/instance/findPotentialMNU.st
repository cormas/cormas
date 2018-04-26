testing
findPotentialMNU
	
	| node |
	node := self findNode ifNil: [^nil].
	^node findPotentialMNUFor: self selectedClass