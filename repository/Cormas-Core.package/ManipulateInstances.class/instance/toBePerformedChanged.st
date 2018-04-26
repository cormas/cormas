initialize-release
toBePerformedChanged
	
	(self builder componentAt: #mainApplyButton) isVisible
		ifFalse: [self stopPainting].
	(self builder componentAt: #controlMethodChoices) disable.
	(self builder componentAt: #attributeToChangeChoices) disable.
	(self builder componentAt: #valueForAttribute) disable.
	self toBePerformed value = #execute
		ifTrue: [^(self builder componentAt: #controlMethodChoices) enable].
	self toBePerformed value = #setValue
		ifTrue:
			[(self builder componentAt: #valueForAttribute) enable.
			(self builder componentAt: #attributeToChangeChoices) enable]