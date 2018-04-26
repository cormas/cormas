display
zoom
	
	self toStep value < self fromStep value
		ifTrue: [self toStep value: self nbPts - 1].
	self
		initializeSlidersFrom: self fromStep value
		to: self toStep value.
	self levelClassName = cormasModel class name
		ifTrue: [self updateGlobalChartsDisplay]
		ifFalse: [self updateLocalChartsDisplay]	"ifTrue: [self updateGlobalChartsDisplayZoom]
		ifFalse: [self updateLocalChartsDisplayZoom]."