changed
higherLevelsChanged
	
	oneLevel value
		ifTrue:
			[higherLevels setValue: true.
			(self builder componentAt: #higherLevels) widget update: #value]
		ifFalse: [appelant higherLevels: higherLevels value]