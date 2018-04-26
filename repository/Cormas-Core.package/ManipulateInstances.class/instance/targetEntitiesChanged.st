initialize-release
targetEntitiesChanged
	
	(self builder componentAt: #mainApplyButton) isVisible
		ifFalse: [self stopPainting].
	self targetEntities value = #subsetEntities
		ifTrue:
			[self resizeWindowToMax.
			(self builder componentAt: #subsetCriteria) isVisible: true]
		ifFalse:
			[self resizeWindowToMin.
			(self builder componentAt: #subsetCriteria) isVisible: false.
			self resetSelection]