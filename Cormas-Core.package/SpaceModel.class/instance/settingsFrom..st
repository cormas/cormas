- utilities - binary storage
settingsFrom: aClone
	
	(self absoluteBounds = aClone absoluteBounds
		and:
			[self column = aClone column
				and:
					[self line = aClone line and: [self nbNeighbours = aClone nbNeighbours]]])
		ifTrue: [aClone isIrregular ifFalse: [^self]].
	self autoResizeBounds: aClone autoResizeBounds.
	aClone isIrregular
		ifFalse:
			[self
				initializeRegularX: aClone column
				Y: aClone line
				shape: aClone gridCellShape
				nbNeighbours: aClone nbNeighbours
				boundaries: aClone boundaries]