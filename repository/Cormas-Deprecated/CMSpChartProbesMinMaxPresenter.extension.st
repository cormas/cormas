Extension { #name : #CMSpChartProbesMinMaxPresenter }

{ #category : #'*Cormas-Deprecated' }
CMSpChartProbesMinMaxPresenter >> simManager [
	"This method was renamed to simulationManager
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #simulationManager insread'.
	^ self simulationManager.
]
