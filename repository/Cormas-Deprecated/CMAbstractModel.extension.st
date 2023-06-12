Extension { #name : #CMAbstractModel }

{ #category : #'*Cormas-Deprecated' }
CMAbstractModel >> initSimulation [
	"This method was renamed to initializeSimulation
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #initializeSimulation insread'.
	^ self initializeSimulation.
]

{ #category : #'*Cormas-Deprecated' }
CMAbstractModel >> simManager [
	"This method was renamed to simulationManager
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #simulationManager insread'.
	^ self simulationManager.
]

{ #category : #'*Cormas-Deprecated' }
CMAbstractModel >> simManager: anObject [
	"This method was renamed to simulationManager:
	It is now deprecated and will be removed in the future releases"
	
	self deprecated: 'Use #simulationManager: insread'.
	self simulationManager: anObject.
]
