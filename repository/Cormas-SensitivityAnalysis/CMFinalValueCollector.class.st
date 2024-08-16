Class {
	#name : 'CMFinalValueCollector',
	#superclass : 'CMDataCollector',
	#category : 'Cormas-SensitivityAnalysis',
	#package : 'Cormas-SensitivityAnalysis'
}

{ #category : 'data collection' }
CMFinalValueCollector >> activateProbeBeforeSimulation [

	"do nothing"
]

{ #category : 'data collection' }
CMFinalValueCollector >> collectDataAfterSimulation [
	
	data add: probe value.
]
