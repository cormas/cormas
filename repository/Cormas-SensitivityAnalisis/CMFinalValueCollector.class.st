Class {
	#name : 'CMFinalValueCollector',
	#superclass : 'CMDataCollector',
	#category : 'Cormas-SensitivityAnalisis',
	#package : 'Cormas-SensitivityAnalisis'
}

{ #category : 'data collection' }
CMFinalValueCollector >> activateProbeBeforeSimulation [

	"do nothing"
]

{ #category : 'data collection' }
CMFinalValueCollector >> collectDataAfterSimulation [
	
	data add: probe value.
]
