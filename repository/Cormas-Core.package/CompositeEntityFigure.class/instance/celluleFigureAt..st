accessing
celluleFigureAt: point
	"returns the elementary figure of this component figure at point."
	
	| cellFig |
	cellFig := self components
		detect: [:fig | fig containsPoint: point]
		ifNone: [nil].
	cellFig ifNil: [^nil].
	cellFig entityType isSpatialEntityElementClass
		ifTrue: [^cellFig]
		ifFalse: [^cellFig celluleFigureAt: point]