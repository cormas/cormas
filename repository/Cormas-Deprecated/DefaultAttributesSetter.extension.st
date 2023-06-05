Extension { #name : #DefaultAttributesSetter }

{ #category : #'*Cormas-Deprecated' }
DefaultAttributesSetter >> simManager [
	"This method was renamed to simulationManager
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #simulationManager insread'.
	^ self simulationManager.
]
