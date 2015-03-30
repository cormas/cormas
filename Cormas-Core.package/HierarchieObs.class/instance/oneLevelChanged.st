changed
oneLevelChanged
	
	appelant oneLevel: oneLevel value.
	oneLevel value
		ifTrue:
			[higherLevels setValue: true.
			(self builder componentAt: #higherLevels) widget update: #value]