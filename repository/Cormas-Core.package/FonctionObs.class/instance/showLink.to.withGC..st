display liens
showLink: a to: b withGC: aGC
	
	oneLevel
		ifTrue:
			[self oneLevel: a to: b withGC: aGC.
			^self].
	higherLevels
		ifTrue:
			[self higherLevels: a to: b withGC: aGC.
			^self].
	self thisLevel: a to: b withGC: aGC