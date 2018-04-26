- activityDiagram
allActivityDiagramSelectors
	"Return the selectors starting with 'activity_'.
	ex: Agent allActivityDiagramSelectors"
	
	^self class allSelectors
		select:
			[:n | 
			(n asString
				indexOfSubCollection: self preStringForActivitySelector
				startingAt: 1) = 1]